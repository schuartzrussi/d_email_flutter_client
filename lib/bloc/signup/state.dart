import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends SignupState {}

class LoadingState extends SignupState {}

class SignupSuccessState extends SignupState {
  final User user;

  SignupSuccessState(this.user);

  @override
  List<Object> get props => [this.user];
}

class SignupErrorState extends SignupState {
  final String message;

  SignupErrorState(this.message);

  @override
  List<Object> get props => [this.message];
}
