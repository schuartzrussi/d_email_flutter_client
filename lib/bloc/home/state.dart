import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool loading;
  final List<Email>? emails;
  final String? fetchError;

  HomeState({required this.loading, this.emails, this.fetchError});

  HomeState copyWith({List<Email>? emails, bool? loading, String? fetchError}) {
    return HomeState(
        emails: emails ?? this.emails,
        loading: loading ?? false,
        fetchError: fetchError ?? null);
  }

  @override
  List<Object?> get props => [this.loading, this.emails, this.fetchError];
}
