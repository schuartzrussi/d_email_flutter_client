import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class UnauthenticatedUserState extends AuthState {}

class LoadingState extends AuthState {}

class AuthenticatedUserState extends AuthState {
  final User user;

  AuthenticatedUserState(this.user);

  @override
  List<Object> get props => [this.user];
}

class LoginErrorState extends AuthState {
  final String message;

  LoginErrorState(this.message);

  @override
  List<Object> get props => [this.message];
}
