import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final EmailRepository emailRepository;

  InboxBloc(this.emailRepository) : super(InboxState(loading: false));

  @override
  Stream<InboxState> mapEventToState(InboxEvent event) async* {
    if (event is LoadEvent) {
      yield* _loadEmails(event);
    }
  }

  Stream<InboxState> _loadEmails(LoadEvent event) async* {
    yield state.copyWith(loading: true);

    try {
      List<Email> emails =
          await this.emailRepository.findAllUserEmails(event.user);
      emails.sort((a, b) => b.sendedAt.compareTo(a.sendedAt));

      yield state.copyWith(emails: emails, loading: false, fetchError: null);
    } catch (e, s) {
      print("StackTrace $s");
      yield state.copyWith(
          fetchError: "Ocorreu um erro inesperado", loading: false);
    }
  }
}
