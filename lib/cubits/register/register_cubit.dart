import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greatticket/services/api_services.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final ApiService _apiService;
  RegisterCubit(this._apiService)
      : super(const RegisterState(
          status: RegisterStatus.initial,
          errorMessage: null,
        ));

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String password2,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String address,
  }) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    try {
      final response = await _apiService.postRequest('register/', {
        'username': username,
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'address': address,
        'password2': password2
      });

      if (response.statusCode == 200) {
        emit(state.copyWith(status: RegisterStatus.successful));
      } else {
        emit(state.copyWith(
            status: RegisterStatus.error,
            errorMessage: 'Something went wrong'));
      }
    } on SocketException {
      emit(state.copyWith(
          status: RegisterStatus.error,
          errorMessage: 'No internet Connection'));
    } catch (e) {
      emit(state.copyWith(
          status: RegisterStatus.error, errorMessage: e.toString()));
    }
  }
}
