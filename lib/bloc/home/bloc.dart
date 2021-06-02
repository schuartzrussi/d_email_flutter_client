import 'package:d_email_flutter_client/bloc/home/state.dart';
import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final EmailRepository emailRepository;

  HomeBloc(this.emailRepository) : super(HomeState(loading: false));

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadEvent) {
      yield* _loadEmails(event);
    }
  }

  Stream<HomeState> _loadEmails(LoadEvent event) async* {
    yield state.copyWith(loading: true);

    try {
      List<Email> emails =
          await this.emailRepository.findAllUserEmails(event.user);

      yield state.copyWith(emails: emails, loading: false, fetchError: null);
    } catch (e, s) {
      print(e);
      print("StackTrace $s");
      yield state.copyWith(
          fetchError: "Ocorreu um erro inesperado", loading: false);
    }
  }
}
