import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:equatable/equatable.dart';

abstract class InboxEvent extends Equatable {}

class LoadEvent extends InboxEvent {
  final User user;

  LoadEvent(this.user);

  @override
  List<Object> get props => [this.user];
}
