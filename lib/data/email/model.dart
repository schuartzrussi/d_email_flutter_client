import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Email extends Equatable {
  final String? creator;
  final String id;
  final String from;
  final List<String> to;
  final String subject;
  final String body;
  final DateTime sendedAt;
  Email? previous;
  final String decryptionKey;
  final String decryptionIV;

  Email(
      {this.creator,
      required this.id,
      required this.from,
      required this.to,
      required this.subject,
      required this.body,
      required this.sendedAt,
      required this.decryptionKey,
      required this.decryptionIV});

  @override
  List<Object?> get props => [
        this.creator,
        this.id,
        this.from,
        this.to,
        this.subject,
        this.body,
        this.sendedAt,
        this.previous,
        this.decryptionKey,
        this.decryptionIV
      ];

  String getFormattedSendedAt() {
    return DateFormat('dd/MM/yyyy hh:mm:ss').format(this.sendedAt);
  }
}
