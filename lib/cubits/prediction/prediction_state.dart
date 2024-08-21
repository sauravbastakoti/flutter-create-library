part of 'prediction_cubit.dart';

enum PredictionStatus {
  initial,
  loading,
  success,
  error,
}

class PredictionState extends Equatable {
  final PredictionStatus? status;
  final String? errorMessage;

  const PredictionState({
    required this.status,
    required this.errorMessage,
  });
  PredictionState copyWith({
    PredictionStatus? status,
    String? errorMessage,
    final String? uploadImage,
  }) {
    return PredictionState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}
