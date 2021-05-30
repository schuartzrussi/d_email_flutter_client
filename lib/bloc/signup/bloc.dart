import 'package:d_email_flutter_client/bloc/signup/event.dart';
import 'package:d_email_flutter_client/bloc/signup/state.dart';
import 'package:d_email_flutter_client/data/user/exception.dart';
import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:d_email_flutter_client/data/user/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository userRepository;

  SignupBloc(this.userRepository) : super(InitialState());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    yield LoadingState();

    try {
      User user = await this
          .userRepository
          .createUser(event.email, event.password, event.mnemonic);

      yield SignupSuccessState(user);
    } on UserAlreadyRegisteredException catch (_) {
      yield SignupErrorState(
          "Ja existe um usuario cadastrado com o email informado.");
    } catch (e) {
      print(e);
      yield SignupErrorState("Ocorreu um erro inesperado");
    }
  }
}
