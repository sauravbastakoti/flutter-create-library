import 'package:KrishiKranti/core/router/app_router.dart';
import 'package:KrishiKranti/core/shared_prefences/counter_bloc.dart';
import 'package:KrishiKranti/core/shared_prefences/locator.dart';
import 'package:KrishiKranti/core/shared_prefences/shared_prefences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferencesService = SharedPreferencesService();
  await sharedPreferencesService.init();
  Bloc.observer = const CounterObserver();
  await setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Use GetMaterialApp to wrap MaterialApp.router
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MaterialApp.router(
        routerConfig: AppRouter.router, // Use go_router for routing
      ),
    );
  }
}
