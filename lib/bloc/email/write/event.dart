import 'package:d_email_flutter_client/data/user/model.dart';
import 'package:equatable/equatable.dart';

class SendEmailEvent extends Equatable {
  final User user;
  final String subject;
  final String body;
  final List<String> to;

  SendEmailEvent(
      {required this.user,
      required this.subject,
      required this.body,
      required this.to});

  @override
  List<Object> get props => [this.user, this.subject, this.body, this.to];
}
