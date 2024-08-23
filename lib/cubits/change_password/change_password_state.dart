part of 'change_password_cubit.dart';

enum ChangePasswordStatus {
  initial,
  loading,
  success,
  error,
}

class ChangePasswordState extends Equatable {
  final ChangePasswordStatus status;

  final String? errorMessage;

  const ChangePasswordState({required this.status, required this.errorMessage});

  ChangePasswordState copyWith({
    ChangePasswordStatus? status,
    String? errorMessage,
  }) {
    return ChangePasswordState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
