import 'dart:io';

import 'package:KrishiKranti/model/profile_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:KrishiKranti/services/api_services.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ApiService _apiService;

  ProfileCubit(this._apiService)
      : super(const ProfileState(
          status: ProfileStatus.initial,
          errorMessage: null,
          profileModel: null,
        ));

  Future<void> loadUserAllDetails() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    // try {
    final response = await _apiService.getRequest('profile/');

    print(response.data);
    if (response.statusCode == 200) {
      final jsonBody = response.data;
      final userAllDetails = ProfileModel.fromJson(jsonBody);

      emit(state.copyWith(
        status: ProfileStatus.success,
        profileModel: userAllDetails,
      ));
    } else {
      emit(state.copyWith(
        status: ProfileStatus.error,
        errorMessage: 'Invalid response',
      ));
    }
    // } on SocketException {
    //   emit(state.copyWith(
    //     status: ProfileStatus.error,
    //     errorMessage: 'No Internet Connection',
    //   ));
    // } catch (e) {
    //   emit(state.copyWith(
    //     status: ProfileStatus.error,
    //     errorMessage: e.toString(),
    //   ));
    // }
  }
}
