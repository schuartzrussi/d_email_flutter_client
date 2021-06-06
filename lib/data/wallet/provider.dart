import 'package:alan/alan.dart' as alanLib;
import 'package:alan/wallet/network_info.dart';
import 'package:alan/proto/cosmos/bank/v1beta1/export.dart' as bank;
import 'package:d_email_flutter_client/data/core/base.dart';
import 'package:d_email_flutter_client/data/user/model.dart';

import 'model.dart';

class DEmailWalletProvider extends BaseDEmailProvider {
  bank.QueryClient? queryClient;

  DEmailWalletProvider(NetworkInfo demailNetworkInfo)
      : super(demailNetworkInfo) {
    final channel = demailNetworkInfo.gRPCChannel;
    this.queryClient = bank.QueryClient(channel);
  }

  Future<Wallet> generateNewWallet() async {
    var mnemonic = alanLib.Bip39.generateMnemonic(strength: 256);
    final wallet = alanLib.Wallet.derive(mnemonic, this.demailNetworkInfo);
    return Wallet(wallet.bech32Address, mnemonic.join(' '));
  }

  Future<int> getBalance(User user) async {
    alanLib.Wallet wallet = generateWallet(user.mnemonic);

    final response =
        await queryClient!.balance(bank.QueryBalanceRequest.create()
          ..address = wallet.bech32Address
          ..denom = "token");

    return int.parse(response.balance.amount);
  }

  Future<void> sendCoins(User user, String to, int amount) async {
    alanLib.Wallet wallet = generateWallet(user.mnemonic);

    final message = bank.MsgSend.create()
      ..fromAddress = wallet.bech32Address
      ..toAddress = to;

    message.amount.add(
      alanLib.Coin.create()
        ..denom = 'token'
        ..amount = amount.toString(),
    );

    final response = await sendTransaction(wallet, message, true);
    if (!response.isSuccessful) {
      throw Exception("Cannot send email");
    }
  }
}
