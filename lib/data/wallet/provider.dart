import 'package:alan/alan.dart' as alanLib;
import 'package:alan/wallet/network_info.dart';
import 'package:alan/proto/cosmos/bank/v1beta1/export.dart' as bank;
import 'package:d_email_flutter_client/data/core/base.dart';
import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<List<CoinTransaction>> getSendedCoinTransactions(User user) async {
    var wallet = generateWallet(user.mnemonic);
    alanLib.QueryHelper helper = alanLib.QueryHelper(httpClient: http.Client());
    var response = await helper.queryChain(
        "http://localhost:26657/tx_search?query=\"transfer.sender='${wallet.bech32Address}'\"&prove=true");
    return processQueryCoinTransactionsResponse(
        response, CoinTransactionType.output);
  }

  Future<List<CoinTransaction>> getReceivedCoinTransactions(User user) async {
    var wallet = generateWallet(user.mnemonic);
    alanLib.QueryHelper helper = alanLib.QueryHelper(httpClient: http.Client());
    var response = await helper.queryChain(
        "http://localhost:26657/tx_search?query=\"transfer.recipient='${wallet.bech32Address}'\"&prove=true");
    return processQueryCoinTransactionsResponse(
        response, CoinTransactionType.input);
  }

  List<CoinTransaction> processQueryCoinTransactionsResponse(
      alanLib.RequestResult<Map<String, dynamic>> response,
      CoinTransactionType transactionType) {
    if (!response.isSuccessful) {
      throw Exception("error getting coin transactions");
    }

    List<CoinTransaction> result = [];
    var queryResult = response.value!["result"];
    queryResult.forEach((key, value) {
      if (key == "txs") {
        value.forEach((tx) {
          if (tx.containsKey("tx_result")) {
            if (tx["tx_result"].containsKey("events")) {
              tx["tx_result"]["events"].forEach((event) {
                if (event.containsKey("type") && event["type"] == "transfer") {
                  if (event.containsKey("attributes")) {
                    String from = "";
                    String to = "";
                    int amount = 0;
                    event["attributes"].forEach((attribute) {
                      var key = utf8.decode(base64.decode(attribute["key"]));
                      var value =
                          utf8.decode(base64.decode(attribute["value"]));

                      if (key == "recipient") {
                        to = value;
                      } else if (key == "sender") {
                        from = value;
                      } else if (key == "amount") {
                        amount = int.parse(value.split("token")[0]);
                      }
                    });

                    result.add(
                        CoinTransaction(from, to, amount, transactionType));
                  }
                }
              });
            }
          }
        });
      }
    });

    return result;
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
