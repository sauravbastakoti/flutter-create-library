// part of 'profile_cubit.dart';

// enum ProfileStatus {
//   initial,
//   loading,
//   success,
//   error,
// }

// class ProfileState extends Equatable {
//   final ProfileStatus status;
//   final String? errorMessage;
//   final ProfileModel? profileModel;

//   const ProfileState(
//     this.profileModel, {
//     required this.status,
//     required this.errorMessage,
//   });
//   ProfileState copyWith({
//     ProfileStatus? status,
//     String? errorMessage,
//     profileModel? profileModel,
//   }) {
//     return ProfileState(
//       status: status ?? this.status,
//       errorMessage: errorMessage ?? this.errorMessage,
//       profileModel: profileModel ?? profileModel,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         status,
//         errorMessage,
//         profileModel,
//       ];
// }

// class ProfileModel {
// }
