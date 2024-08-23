import 'dart:convert';
import 'dart:io';

import 'package:KrishiKranti/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'prediction_state.dart';

class UpdateProfilePictureCubit extends Cubit<PredictionState> {
  final ApiService _apiService;

  UpdateProfilePictureCubit(this._apiService)
      : super(
          const PredictionState(
            status: PredictionStatus.initial,
            errorMessage: null,
          ),
        );

  Future<String?> imageFileToBase64(File imageFile) async {
    // Read the file as bytes
    List<int> imageBytes = await imageFile.readAsBytes();

    // Convert bytes to base64 string
    String base64Image = base64Encode(imageBytes);

    return base64Image;
  }

  Future<void> uploadImage({required XFile image}) async {
    emit(state.copyWith(status: PredictionStatus.loading));
    try {
      // Ensure filename does not exceed the limit
      String filename = image.name;
      if (filename.length > 100) {
        filename = filename.substring(0, 100);
      }

      final file = await MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last);

      final formData = FormData.fromMap({'display_picture': file});
      final imageUrl = await imageFileToBase64(File(
        image.path,
      ));

      final response = await _apiService.postRequest(
          'auth/update/profile/picture/', formData);

      if (response.statusCode == 200) {
        emit(
          state.copyWith(status: PredictionStatus.success),
        );
      } else {
        emit(
          state.copyWith(
            status: PredictionStatus.error,
            errorMessage:
                response.statusMessage ?? 'Failed to update profile picture',
          ),
        );
      }
    } on DioException catch (e) {
      // Debug: Print DioError details
      print('DioError: ${e.response?.data}');
      emit(
        state.copyWith(
          status: PredictionStatus.error,
          errorMessage: e.response?.data['message'] ??
              'Unexpected error occurred, please try again',
        ),
      );
    } catch (e) {
      // General exception handling
      emit(
        state.copyWith(
          status: PredictionStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
