import 'package:alan/alan.dart';
import 'package:protobuf/protobuf.dart';

abstract class BaseDEmailProvider {
  final NetworkInfo demailNetworkInfo;

  BaseDEmailProvider(this.demailNetworkInfo);

  Wallet generateWallet(String mnemonic) {
    return Wallet.derive(mnemonic.split(' '), this.demailNetworkInfo);
  }

  Future<TxResponse> sendTransaction(Wallet wallet, GeneratedMessage message,
      bool waitForBlockConfirmation) async {
    final signer = TxSigner.fromNetworkInfo(this.demailNetworkInfo);
    final tx = await signer.createAndSign(wallet, [message]);
    final txSender = TxSender.fromNetworkInfo(this.demailNetworkInfo);

    var mode = BroadcastMode.BROADCAST_MODE_SYNC;
    if (waitForBlockConfirmation) {
      mode = BroadcastMode.BROADCAST_MODE_BLOCK;
    }

    final response = await txSender.broadcastTx(tx, mode: mode);
    return response;
  }
}
