import 'package:d_email_flutter_client/bloc/auth/event.dart';
import 'package:d_email_flutter_client/bloc/auth/state.dart';
import 'package:d_email_flutter_client/data/user/exception.dart';
import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:d_email_flutter_client/data/user/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc(this.userRepository) : super(UnauthenticatedUserState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield* _login(event);
    } else if (event is AutoLoginEvent) {
      yield* _autoLogin(event);
    }
  }

  Stream<AuthState> _login(LoginEvent event) async* {
    yield LoadingState();

    try {
      User authenticatedUser = await this
          .userRepository
          .authenticateUser(event.email, event.password);

      yield AuthenticatedUserState(authenticatedUser);
    } on InvalidCredentialsException catch (_) {
      yield LoginErrorState("Credenciais invalidas");
    } on UnregisteredUserException catch (_) {
      yield LoginErrorState("Usuario nao cadastrado");
    } catch (_) {
      yield LoginErrorState("Ocorreu um erro inesperado");
    }
  }
}

Stream<AuthState> _autoLogin(AutoLoginEvent event) async* {
  yield AuthenticatedUserState(event.user);
}
