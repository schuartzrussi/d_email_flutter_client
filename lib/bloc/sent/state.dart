import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:equatable/equatable.dart';

class SentState extends Equatable {
  final bool loading;
  final List<Email>? emails;
  final String? fetchError;

  SentState({required this.loading, this.emails, this.fetchError});

  SentState copyWith({List<Email>? emails, bool? loading, String? fetchError}) {
    return SentState(
        emails: emails ?? this.emails,
        loading: loading ?? false,
        fetchError: fetchError ?? null);
  }

  @override
  List<Object?> get props => [this.loading, this.emails, this.fetchError];
}
