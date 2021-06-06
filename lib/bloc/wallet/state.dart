import 'package:d_email_flutter_client/data/wallet/model.dart';
import 'package:equatable/equatable.dart';

class WalletState extends Equatable {
  final bool loading;
  final String? error;
  final int? balance;
  final bool sendSuccess;
  final List<CoinTransaction>? coinTransactions;

  WalletState(
      {required this.loading,
      required this.sendSuccess,
      this.error,
      this.balance,
      this.coinTransactions});

  WalletState copyWith(
      {bool? loading,
      String? error,
      int? total,
      bool? sendSuccess,
      List<CoinTransaction>? coinTransactions}) {
    return WalletState(
        balance: total ?? this.balance,
        loading: loading ?? false,
        error: error ?? null,
        sendSuccess: sendSuccess ?? false,
        coinTransactions: coinTransactions ?? this.coinTransactions);
  }

  @override
  List<Object?> get props =>
      [this.loading, this.error, this.balance, this.coinTransactions];
}
