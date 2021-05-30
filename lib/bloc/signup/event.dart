import 'package:equatable/equatable.dart';

class SignupEvent extends Equatable {
  final String email;
  final String password;
  final String mnemonic;

  SignupEvent(this.email, this.password, this.mnemonic);

  @override
  List<Object> get props => [this.email, this.password];
}
