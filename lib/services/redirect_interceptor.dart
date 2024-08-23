import 'package:dio/dio.dart';
import 'package:KrishiKranti/core/router/app_router.dart';
import 'package:KrishiKranti/core/shared_prefences/locator.dart';
import 'package:KrishiKranti/core/shared_prefences/shared_prefences_service.dart';
import 'package:KrishiKranti/features/login_register/login_screen.dart';

class RedirectInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      locator.get<SharedPreferencesService>().clear();
      AppRouter.router.goNamed(LoginScreen.routeName);
    }
    super.onError(err, handler);
  }
}
