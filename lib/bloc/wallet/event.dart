import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:equatable/equatable.dart';

abstract class WalletEvent extends Equatable {}

class LoadEvent extends WalletEvent {
  final User user;

  LoadEvent(this.user);

  @override
  List<Object> get props => [this.user];
}

class SendEvent extends WalletEvent {
  final User user;
  final String to;
  final int amount;

  SendEvent(this.user, this.to, this.amount);

  @override
  List<Object?> get props => [this.user, this.to, this.amount];
}
