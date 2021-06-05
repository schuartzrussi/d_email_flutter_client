import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:equatable/equatable.dart';

class InboxState extends Equatable {
  final bool loading;
  final List<Email>? emails;
  final String? fetchError;

  InboxState({required this.loading, this.emails, this.fetchError});

  InboxState copyWith(
      {List<Email>? emails, bool? loading, String? fetchError}) {
    return InboxState(
        emails: emails ?? this.emails,
        loading: loading ?? false,
        fetchError: fetchError ?? null);
  }

  @override
  List<Object?> get props => [this.loading, this.emails, this.fetchError];
}
