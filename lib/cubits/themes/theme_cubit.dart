// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:KrishiKranti/core/shared_prefences/shared_prefences_service.dart';

// enum ThemeType { light, dark }

// class ThemeCubit extends Cubit<ThemeType?> {
//   final SharedPreferencesService _preferencesService;

//   ThemeCubit(this._preferencesService) : super(null) {
//     _loadTheme();
//   }

//   void changeTheme(ThemeType theme) {
//     emit(theme);
//     _preferencesService.theme = theme == ThemeType.dark ? 'dark' : 'light';
//   }

//   void _loadTheme() {
//     String theme = _preferencesService.theme;
//     emit(theme == 'dark' ? ThemeType.dark : ThemeType.light);
//   }
// }
