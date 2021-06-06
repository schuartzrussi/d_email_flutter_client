import 'package:d_email_flutter_client/data/wallet/model.dart';
import 'package:d_email_flutter_client/data/wallet/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class GenerateWalletBloc
    extends Bloc<GenerateWalletEvent, GenerateWalletState> {
  final WalletRepository walletRepository;

  GenerateWalletBloc(this.walletRepository)
      : super(GenerateWalletState(loading: false));

  @override
  Stream<GenerateWalletState> mapEventToState(
      GenerateWalletEvent event) async* {
    yield state.copyWith(loading: true);
    Wallet wallet = await this.walletRepository.generateNewWallet();
    yield state.copyWith(loading: false, wallet: wallet);
  }
}
