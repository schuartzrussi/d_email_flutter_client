import 'package:d_email_flutter_client/data/email/model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool loading;
  final List<Email>? emails;
  final bool fetchError;

  HomeState({required this.loading, this.emails, required this.fetchError});

  HomeState copyWith({List<Email>? emails, bool? loading, bool? fetchError}) {
    return HomeState(
        emails: emails ?? this.emails,
        loading: loading ?? false,
        fetchError: fetchError ?? false);
  }

  @override
  List<Object?> get props => [this.loading, this.emails, this.fetchError];
}
