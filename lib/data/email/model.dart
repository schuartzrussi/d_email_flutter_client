import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class Email {
  @HiveField(0)
  final String? creator;

  @HiveField(1)
  final String id;

  @HiveField(2)
  final String from;

  @HiveField(3)
  final List<String> to;

  @HiveField(4)
  final String subject;

  @HiveField(5)
  final String body;

  @HiveField(6)
  final DateTime sendedAt;

  @HiveField(7)
  String? previousID;

  @HiveField(8)
  final String decryptionKey;

  @HiveField(9)
  final String decryptionIV;

  Email? previous;

  Email(
      {this.creator,
      required this.id,
      required this.from,
      required this.to,
      required this.subject,
      required this.body,
      required this.sendedAt,
      required this.decryptionKey,
      required this.decryptionIV,
      this.previousID,
      this.previous});

  String getFormattedSendedAt() {
    return DateFormat('dd/MM/yyyy hh:mm:ss').format(this.sendedAt);
  }
}
