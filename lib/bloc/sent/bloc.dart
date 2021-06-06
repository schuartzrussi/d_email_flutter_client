import 'package:d_email_flutter_client/bloc/sent/state.dart';
import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class SentBloc extends Bloc<SentEvent, SentState> {
  final EmailRepository emailRepository;

  SentBloc(this.emailRepository) : super(SentState(loading: false));

  @override
  Stream<SentState> mapEventToState(SentEvent event) async* {
    if (event is LoadEvent) {
      yield* _loadEmails(event);
    }
  }

  Stream<SentState> _loadEmails(LoadEvent event) async* {
    yield state.copyWith(loading: true);

    try {
      List<Email> emails =
          await this.emailRepository.findAllUserSentEmails(event.user);
      emails.sort((a, b) => b.sendedAt.compareTo(a.sendedAt));

      yield state.copyWith(emails: emails, loading: false, fetchError: null);
    } catch (e, s) {
      print("StackTrace $s");
      yield state.copyWith(
          fetchError: "Ocorreu um erro inesperado", loading: false);
    }
  }
}
