//main file
import 'dart:developer';
import 'dart:io';

import 'package:KrishiKranti/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ApiService _apiService;
  ChangePasswordCubit(this._apiService)
      : super(const ChangePasswordState(
          status: ChangePasswordStatus.initial,
          errorMessage: null,
        ));
/////////hehre to do wprk
  Future<void> changePasswordverify(
    String passwordController,
    String confirmPasswordController,
  ) async {
    emit(state.copyWith(status: ChangePasswordStatus.loading));
    try {
      final response =
          await _apiService.postRequest('profile/change-password/', {
        'old_password': passwordController,
        'new_password': confirmPasswordController,
      });
      //  option: Options(headers: {"Authorization": "Bearer $accessToken"}));

      if (response.statusCode == 200) {
        log(response.data.toString());
        emit(state.copyWith(status: ChangePasswordStatus.success));
      } else {
        emit(state.copyWith(
            status: ChangePasswordStatus.error, errorMessage: 'Invalid '));
      }
    } on SocketException {
      emit(state.copyWith(
          status: ChangePasswordStatus.error,
          errorMessage: 'No internet Connection'));
    } catch (e) {
      emit(state.copyWith(
          status: ChangePasswordStatus.error, errorMessage: e.toString()));
    }
  }
}
