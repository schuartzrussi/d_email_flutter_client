import 'package:d_email_flutter_client/data/wallet/model.dart';
import 'package:equatable/equatable.dart';

class GenerateWalletState extends Equatable {
  final bool loading;
  final Wallet? wallet;

  GenerateWalletState({required this.loading, this.wallet});

  GenerateWalletState copyWith({bool? loading, Wallet? wallet}) {
    return GenerateWalletState(
        loading: loading ?? false, wallet: wallet ?? this.wallet);
  }

  @override
  List<Object?> get props => [this.loading, this.wallet];
}
