part of 'otp_verify_cubit.dart';

enum OtpForgotPasswordStatus {
  initial,
  loading,
  success,
  error,
}

class OtpForgotPasswordState extends Equatable {
  final OtpForgotPasswordStatus status;

  final String? errorMessage;

  const OtpForgotPasswordState(
      {required this.status, required this.errorMessage});

  OtpForgotPasswordState copyWith({
    OtpForgotPasswordStatus? status,
    String? errorMessage,
  }) {
    return OtpForgotPasswordState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
