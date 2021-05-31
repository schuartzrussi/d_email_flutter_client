import 'package:alan/alan.dart';
import 'package:alan/wallet/export.dart';
import 'package:alan/wallet/network_info.dart';
import 'package:d_email_flutter_client/data/core/repository/repository.dart';
import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:d_email_flutter_client/util/date.dart';
import 'package:encrypt/encrypt.dart';
import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:d_email_flutter_client/proto/cosmos/address/query.pbgrpc.dart';
import 'package:d_email_flutter_client/proto/cosmos/address/address.pb.dart';
import 'package:d_email_flutter_client/proto/cosmos/email/tx.pb.dart';
import 'package:rsa_encrypt/rsa_encrypt.dart' as rsaEncrypt;
import 'package:pointycastle/export.dart';

import 'package:d_email_flutter_client/util/crypto.dart';

class EmailRepository extends Repository {
  final NetworkInfo demailNetworkInfo;

  EmailRepository(this.demailNetworkInfo);

  Future<void> sendEmail(
      User user, List<String> to, String subject, String body) async {
    final key = Key.fromBase64(CryptoUtils.createCryptoRandomString(32));
    final iv = IV.fromLength(16);

    final String aesKeyValue = '$iv-$key';

    var _rsaKeyHelper = rsaEncrypt.RsaKeyHelper();
    final encrypter = Encrypter(AES(key));

    Wallet wallet =
        Wallet.derive(user.mnemonic.split(' '), this.demailNetworkInfo);

    List<String> trackIDs = [];
    List<String> decryptionKeys = [];

    List<Address> addresses = await getAddresses(to);
    addresses.forEach((address) {
      if (!trackIDs.contains(address.trackID.toString())) {
        trackIDs.add(address.trackID.toString());
      }

      RSAPublicKey publicKey =
          _rsaKeyHelper.parsePublicKeyFromPem(address.pubKey);

      decryptionKeys.add(rsaEncrypt.encrypt(aesKeyValue, publicKey));
    });

    String encryptedFrom = encrypter.encrypt(user.email, iv: iv).base64;

    RSAPrivateKey userPrivateKey =
        _rsaKeyHelper.parsePrivateKeyFromPem(user.rsaPrivateKey);
    String signature = _rsaKeyHelper.sign(encryptedFrom, userPrivateKey);

    final message = MsgCreateEmail.create()
      ..creator = wallet.bech32Address
      ..from = encryptedFrom
      ..subject = encrypter.encrypt(subject, iv: iv).base64
      ..body = encrypter.encrypt(body, iv: iv).base64 // TODO save in IPFS
      ..sendedAt = DateUtils.getCurrentISOTimeString()
      ..senderAddressVersion = fixnum.Int64(1)
      ..to = encrypter.encrypt(to.join(";"), iv: iv).base64
      ..senderSignature = signature;

    message.decryptionKeys.addAll(decryptionKeys);
    message.trackIds.addAll(trackIDs);

    final signer = TxSigner.fromNetworkInfo(this.demailNetworkInfo);

    try {
      final tx = await signer.createAndSign(wallet, [message]);
      final txSender = TxSender.fromNetworkInfo(this.demailNetworkInfo);
      final response = await txSender.broadcastTx(tx,
          mode: BroadcastMode.BROADCAST_MODE_SYNC);

      if (!response.isSuccessful) {
        print(response.toString());
        throw Exception("Cannot create transaction");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<Address>> getAddresses(List<String> names) async {
    final channel = this.demailNetworkInfo.gRPCChannel;

    final addressClient = QueryClient(channel);

    List<Address> result = [];

    for (int i = 0; i < names.length; i++) {
      final response = await addressClient
          .addressByName(QueryGetAddressByNameRequest(name: names[i]));
      result.add(response.address);
    }

    print(result);
    return result;
  }

  @override
  void dispose() {}
}
