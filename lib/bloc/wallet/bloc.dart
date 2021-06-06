import 'package:d_email_flutter_client/bloc/wallet/state.dart';
import 'package:d_email_flutter_client/data/wallet/model.dart';
import 'package:d_email_flutter_client/data/wallet/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository walletRepository;

  WalletBloc(this.walletRepository)
      : super(WalletState(loading: false, sendSuccess: false));

  @override
  Stream<WalletState> mapEventToState(event) async* {
    if (event is LoadEvent) {
      yield* _load(event);
    } else if (event is SendEvent) {
      yield* _send(event);
    }
  }

  Stream<WalletState> _load(LoadEvent event) async* {
    yield state.copyWith(loading: true, error: null);

    try {
      int balance = await this.walletRepository.getBalance(event.user);
      List<CoinTransaction> coinTransactions =
          await this.walletRepository.getAllCoinTransactions(event.user);

      yield state.copyWith(
          loading: false,
          error: null,
          total: balance,
          coinTransactions: coinTransactions);
    } catch (e, s) {
      print("StackTrace $s");
      yield state.copyWith(error: "Ocorreu um erro inesperado", loading: false);
    }
  }

  Stream<WalletState> _send(SendEvent event) async* {
    yield state.copyWith(loading: true, error: null);

    try {
      await this.walletRepository.sendCoins(event.user, event.to, event.amount);
      yield state.copyWith(loading: false, sendSuccess: true);
    } catch (e, s) {
      print("StackTrace $s");
      yield state.copyWith(error: "Ocorreu um erro inesperado", loading: false);
    }
  }
}
