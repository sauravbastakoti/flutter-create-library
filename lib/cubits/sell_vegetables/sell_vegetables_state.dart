part of 'sell_vegetables_cubit.dart';

enum SellVegetablesStatus {
  initial,
  loading,
  successful, //successful
  error
}

class SellVegetablesState extends Equatable {
  final SellVegetablesStatus status;

  final String? errorMessage;

  const SellVegetablesState({required this.status, required this.errorMessage});

  SellVegetablesState copyWith({
    SellVegetablesStatus? status,
    String? errorMessage,
  }) {
    return SellVegetablesState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
