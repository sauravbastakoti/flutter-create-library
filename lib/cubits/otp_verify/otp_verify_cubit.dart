import 'dart:io';

import 'package:KrishiKranti/services/api_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_verify_state.dart';

class OtpForgotPasswordCubit extends Cubit<OtpForgotPasswordState> {
  final ApiService _apiService;
  OtpForgotPasswordCubit(this._apiService)
      : super(const OtpForgotPasswordState(
          status: OtpForgotPasswordStatus.initial,
          errorMessage: null,
        ));
/////////hehre to do wprk
  Future<void> otpforgotpasswordverify(
    String username,
  ) async {
    emit(state.copyWith(status: OtpForgotPasswordStatus.loading));
    try {
      final response = await _apiService.postRequest('request-otp/', {
        'email': username,
      });

      print(response.data);
      if (response.statusCode == 200) {
        emit(state.copyWith(status: OtpForgotPasswordStatus.success));
      } else {
        emit(state.copyWith(
            status: OtpForgotPasswordStatus.error, errorMessage: 'Invalid '));
      }
    } on SocketException {
      emit(state.copyWith(
          status: OtpForgotPasswordStatus.error,
          errorMessage: 'No internet Connection'));
    } catch (e) {
      emit(state.copyWith(
          status: OtpForgotPasswordStatus.error, errorMessage: e.toString()));
    }
  }
}
