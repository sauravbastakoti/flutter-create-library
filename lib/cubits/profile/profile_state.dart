part of 'profile_cubit.dart';

enum ProfileStatus {
  initial,
  loading,
  success,
  error,
}

class ProfileState extends Equatable {
  final ProfileStatus status;
  final String? errorMessage;
  final ProfileModel? profileModel;

  const ProfileState({
    required this.status,
    this.errorMessage,
    this.profileModel,
  });

  ProfileState copyWith({
    ProfileStatus? status,
    String? errorMessage,
    ProfileModel? profileModel,
  }) {
    return ProfileState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      profileModel: profileModel ?? this.profileModel,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        profileModel,
      ];
}
