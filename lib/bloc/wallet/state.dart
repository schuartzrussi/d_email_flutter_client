import 'package:equatable/equatable.dart';

class WalletState extends Equatable {
  final bool loading;
  final String? error;
  final int? balance;
  final bool sendSuccess;

  WalletState(
      {required this.loading,
      required this.sendSuccess,
      this.error,
      this.balance});

  WalletState copyWith(
      {bool? loading, String? error, int? total, bool? sendSuccess}) {
    return WalletState(
        balance: total ?? this.balance,
        loading: loading ?? false,
        error: error ?? null,
        sendSuccess: sendSuccess ?? false);
  }

  @override
  List<Object?> get props => [this.loading, this.error, this.balance];
}
