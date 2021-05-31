import 'package:equatable/equatable.dart';

class WriteEmailState extends Equatable {
  final String? error;
  final bool loading;
  final bool success;

  WriteEmailState({this.error, required this.loading, required this.success});

  WriteEmailState copyWith({String? error, bool? loading, bool? success}) {
    return WriteEmailState(
        error: error ?? null,
        loading: loading ?? false,
        success: success ?? false);
  }

  @override
  List<Object?> get props => [this.error, this.loading, this.success];
}
