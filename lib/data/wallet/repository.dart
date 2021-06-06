import 'package:alan/alan.dart' as alanLib;
import 'package:d_email_flutter_client/data/core/repository.dart';
import 'package:d_email_flutter_client/data/user/model.dart';

import 'model.dart';
import 'provider.dart';

class WalletRepository extends Repository {
  final alanLib.NetworkInfo demailNetworkInfo;
  DEmailWalletProvider? walletProvider;

  WalletRepository(this.demailNetworkInfo) {
    this.walletProvider = DEmailWalletProvider(this.demailNetworkInfo);
  }

  Future<Wallet> generateNewWallet() async {
    return await this.walletProvider!.generateNewWallet();
  }

  Future<int> getBalance(User user) async {
    return await this.walletProvider!.getBalance(user);
  }

  Future<void> sendCoins(User user, String to, int amount) async {
    await this.walletProvider!.sendCoins(user, to, amount);
  }

  @override
  void dispose() {}
}
