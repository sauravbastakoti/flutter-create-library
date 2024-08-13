import 'package:get_it/get_it.dart';
import 'package:greatticket/core/shared_prefences/shared_prefences_service.dart';
import 'package:greatticket/services/api_services.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerSingletonAsync(() async {
    final pref = SharedPreferencesService();
    await pref.init();
    return pref;
  });

  locator.registerLazySingleton(() => ApiService());

  return await locator.allReady();
}
