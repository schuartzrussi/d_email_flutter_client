import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  final String address;
  final String mnemonic;

  Wallet(this.address, this.mnemonic);

  @override
  List<Object?> get props => [this.address, this.mnemonic];
}

class CoinTransaction extends Equatable {
  final String to;
  final String amount;

  CoinTransaction(this.to, this.amount);

  @override
  List<Object?> get props => [this.to, this.amount];
}
