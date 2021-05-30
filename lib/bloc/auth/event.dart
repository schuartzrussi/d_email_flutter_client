import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);

  @override
  List<Object> get props => [this.email, this.password];
}

class AutoLoginEvent extends AuthEvent {
  final User user;

  AutoLoginEvent(this.user);

  @override
  List<Object> get props => [this.user];
}
