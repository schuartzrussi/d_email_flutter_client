import 'package:alan/wallet/export.dart';
import 'package:d_email_flutter_client/data/core/repository/repository.dart';
import 'package:d_email_flutter_client/proto/cosmos/address/tx.pb.dart'
    as addressTx;
import 'package:hive/hive.dart';

import 'exception.dart';
import 'model.dart';
import 'package:alan/alan.dart';

import 'package:rsa_encrypt/rsa_encrypt.dart';
import 'package:pointycastle/export.dart';

class UserRepository extends Repository {
  final Box<User> hiveBox;
  final NetworkInfo demailNetworkInfo;

  UserRepository(this.hiveBox, this.demailNetworkInfo);

  Future<User> createUser(
      String email, String password, String mnemonic) async {
    User? currentUser = await findUserByEmail(email);
    if (currentUser != null) {
      throw UserAlreadyRegisteredException();
    }

    Wallet wallet = Wallet.derive(mnemonic.split(' '), this.demailNetworkInfo);

    var _rsaKeyHelper = RsaKeyHelper();
    final _keyPair =
        await _rsaKeyHelper.computeRSAKeyPair(_rsaKeyHelper.getSecureRandom());

    String encodedPublicKey = _rsaKeyHelper
        .encodePublicKeyToPemPKCS1(_keyPair.publicKey as RSAPublicKey);

    String encodedPrivateKey = _rsaKeyHelper
        .encodePrivateKeyToPemPKCS1(_keyPair.privateKey as RSAPrivateKey);

    final message = addressTx.MsgCreateAddress.create()
      ..creator = wallet.bech32Address
      ..name = email
      ..pubKey = encodedPublicKey;

    final signer = TxSigner.fromNetworkInfo(this.demailNetworkInfo);
    int trackID = -1;

    try {
      final tx = await signer.createAndSign(wallet, [message]);
      final txSender = TxSender.fromNetworkInfo(this.demailNetworkInfo);
      final response = await txSender.broadcastTx(tx,
          mode: BroadcastMode.BROADCAST_MODE_BLOCK);

      if (response.isSuccessful) {
        response.logs.forEach((element) => {
              element.events.forEach((event) => {
                    if (event.type == 'address')
                      {
                        event.attributes.forEach((attribute) {
                          if (attribute.key == 'trackID') {
                            trackID = int.parse(attribute.value);
                          }
                        })
                      }
                  })
            });
      } else {
        throw Exception("Cannot generate address");
      }
    } catch (e) {
      throw e;
    }

    if (trackID == -1) {
      throw Exception("Cannot find trackID");
    }

    User user = User(email, password, mnemonic, encodedPublicKey,
        encodedPrivateKey, trackID);

    await this.hiveBox.put(user.email, user);
    return user;
  }

  Future<User?> findUserByEmail(String email) async {
    User? user = this.hiveBox.get(email);
    return user != null ? user : null;
  }

  Future<User> authenticateUser(String email, String password) async {
    User? user = await findUserByEmail(email);

    if (user == null) {
      throw UnregisteredUserException();
    }

    if (user.password != password) {
      throw InvalidCredentialsException();
    }

    return user;
  }

  @override
  void dispose() {
    hiveBox.close();
  }
}
