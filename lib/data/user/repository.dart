import 'package:alan/wallet/export.dart';
import 'package:d_email_flutter_client/crypto/rsa/rsa.dart';
import 'package:d_email_flutter_client/data/address/provider.dart';
import 'package:d_email_flutter_client/data/core/repository.dart';
import 'package:hive/hive.dart';
import 'exception.dart';
import 'model.dart';
import 'package:alan/alan.dart';

class UserRepository extends Repository {
  final Box<User> hiveBox;
  final NetworkInfo demailNetworkInfo;
  DEmailAddressProvider addressProvider;

  UserRepository(this.hiveBox, this.demailNetworkInfo)
      : this.addressProvider = DEmailAddressProvider(demailNetworkInfo);

  Future<User> createUser(
      String email, String password, String mnemonic) async {
    User? currentUser = await findUserByEmail(email);
    if (currentUser != null) {
      throw UserAlreadyRegisteredException();
    }

    var rsaKeyPar = await RSAImpl().setNewKeyPair();

    var address = await this
        .addressProvider
        .createAddress(mnemonic, email, rsaKeyPar.pemPublicKey!);

    User user = User(email, password, mnemonic, rsaKeyPar.pemPublicKey!,
        rsaKeyPar.pemPrivateKey!, address.trackID);

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
