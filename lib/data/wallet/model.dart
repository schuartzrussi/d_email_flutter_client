import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  final String address;
  final String mnemonic;

  Wallet(this.address, this.mnemonic);

  @override
  List<Object?> get props => [this.address, this.mnemonic];
}

enum CoinTransactionType { input, output }

class CoinTransaction extends Equatable {
  final String from;
  final String to;
  final int amount;
  final CoinTransactionType transactionType;

  CoinTransaction(this.from, this.to, this.amount, this.transactionType);

  @override
  List<Object?> get props =>
      [this.from, this.to, this.amount, this.transactionType];
}
