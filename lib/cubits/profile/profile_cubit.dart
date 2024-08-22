// import 'dart:io';

// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:greatticket/services/api_services.dart';

// part 'profile_state.dart';

// class ProfileCubit extends Cubit<ProfileState> {
  
//   final ApiService _apiService;
//   ProfileCubit(this._apiService)
//       : super(const ProfileState(
//           status: ProfileStatus.initial,
//           errorMessage: null,
//           profile: null,
//         ));
//   Future<void> loadUserAllDetails() async {
//     emit(state.copyWith(status: UserAllDetailsStatus.loading));
//     try {
//       final response = await _apiService.getRequest('auth/user/all/details/');

//       print(response.data);
//       if (response.statusCode == 200) {
//         final jsonBody = response.data;
//         final userAllDetails = Prof.fromJson(jsonBody['data']);

//         emit(state.copyWith(
//           status: UserAllDetailsStatus.success,
//           userAllDetailsModel: userAllDetails,
//         ));
//       } else {
//         emit(state.copyWith(
//             status: UserAllDetailsStatus.error, errorMessage: 'Invalid'));
//       }
//     } on SocketException {
//       emit(state.copyWith(
//           status: UserAllDetailsStatus.error,
//           errorMessage: 'No Internet Connection'));
//     } catch (e) {
//       emit(state.copyWith(
//           status: UserAllDetailsStatus.error, errorMessage: e.toString()));
//     }
//   }
// }
