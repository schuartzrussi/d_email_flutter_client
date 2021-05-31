import 'package:d_email_flutter_client/bloc/email/write/state.dart';
import 'package:d_email_flutter_client/data/email/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class WriteEmailBloc extends Bloc<SendEmailEvent, WriteEmailState> {
  final EmailRepository emailRepository;

  WriteEmailBloc(this.emailRepository)
      : super(WriteEmailState(loading: false, success: false));

  @override
  Stream<WriteEmailState> mapEventToState(SendEmailEvent event) async* {
    yield state.copyWith(loading: true);

    try {
      await this
          .emailRepository
          .sendEmail(event.user, event.to, event.subject, event.body);

      yield state.copyWith(success: true, loading: false, error: null);
    } catch (e, s) {
      print(e);
      print("StackTrace $s");
      yield state.copyWith(error: "Ocorreu um erro inesperado", loading: false);
    }
  }
}
