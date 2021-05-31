import 'package:equatable/equatable.dart';

class Email extends Equatable {
  final String creator;

  final String id;
  final String from;
  final List<String> to;
  final String senderSignature;
  final int senderAddressVersion;
  final String subject;
  final String body;
  final List<String> attachments;
  final String replyTo;
  final List<String> trackIds;
  final String sendedAt;
  final List<String> decryptionKeys;
  final String previousDecryptionKey;

  Email(
      {required this.creator,
      required this.id,
      required this.from,
      required this.to,
      required this.senderSignature,
      required this.senderAddressVersion,
      required this.subject,
      required this.body,
      required this.attachments,
      required this.replyTo,
      required this.trackIds,
      required this.sendedAt,
      required this.decryptionKeys,
      required this.previousDecryptionKey});

  @override
  List<Object?> get props => [
        this.creator,
        this.id,
        this.from,
        this.to,
        this.senderSignature,
        this.senderAddressVersion,
        this.subject,
        this.body,
        this.attachments,
        this.replyTo,
        this.trackIds,
        this.sendedAt,
        this.decryptionKeys,
        this.previousDecryptionKey
      ];
}
