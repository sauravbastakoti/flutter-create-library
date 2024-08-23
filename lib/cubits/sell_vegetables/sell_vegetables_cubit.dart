import 'dart:io';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:KrishiKranti/services/api_services.dart';

part 'sell_vegetables_state.dart';

class SellVegetablesCubit extends Cubit<SellVegetablesState> {
  final ApiService _apiService;

  SellVegetablesCubit(this._apiService)
      : super(const SellVegetablesState(
          status: SellVegetablesStatus.initial,
          errorMessage: null,
        ));

  Future<void> sell({
    required String productName,
    required String productPrice,
    required String productDescription,
    required String categoryId,
    required String imagePath,
  }) async {
    emit(state.copyWith(status: SellVegetablesStatus.loading));

    try {
      final file = File(imagePath);
      if (!file.existsSync()) {
        emit(state.copyWith(
            status: SellVegetablesStatus.error,
            errorMessage: 'File does not exist'));
        return;
      }

      print('Uploading file: ${file.path}, size: ${file.lengthSync()} bytes');

      FormData formData = FormData.fromMap({
        'product_name': productName,
        'product_price': productPrice,
        'product_description': productDescription,
        'category_id': categoryId,
        'product_image': await MultipartFile.fromFile(imagePath),
      });

      final response =
          await _apiService.postRequest('seller/products/', formData);

      print('Response: ${response.data}');
      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 201) {
        // Changed to 201 for Created
        emit(state.copyWith(status: SellVegetablesStatus.successful));
      } else {
        emit(state.copyWith(
            status: SellVegetablesStatus.error,
            errorMessage: 'Something went wrong'));
      }
    } on SocketException {
      emit(state.copyWith(
          status: SellVegetablesStatus.error,
          errorMessage: 'No internet Connection'));
    } catch (e) {
      emit(state.copyWith(
          status: SellVegetablesStatus.error, errorMessage: e.toString()));
    }
  }
}
