import 'package:KrishiKranti/features/login_register/login_screen.dart';
import 'package:KrishiKranti/features/login_register/register_screen.dart';
import 'package:KrishiKranti/features/screens/dashboard.dart';
import 'package:KrishiKranti/features/screens/event.dart';
import 'package:KrishiKranti/features/screens/profile.dart';
import 'package:KrishiKranti/features/screens/scan.dart';
import 'package:KrishiKranti/features/screens/settings/user_informations.dart';
import 'package:KrishiKranti/responsive/scaffold_with_bottom_navbar.dart';
import 'package:KrishiKranti/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      name: RegisterScreen.routeName,
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
    ),
    GoRoute(
      name: UserInformations.routeName,
      path: '/userinformations',
      builder: (BuildContext context, GoRouterState state) {
        return const UserInformations();
      },
    ),
    ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithBottomNavbar(child: child);
        },
        routes: [
          GoRoute(
            name: DashboardScreen.routeName,
            path: '/dashboard',
            builder: (context, state) =>
                DashboardScreen(pageController: PageController()),
          ),
          GoRoute(
            name: Categories.routeName,
            path: '/events',
            builder: (context, state) =>
                Categories(pageController: PageController()),
          ),
          GoRoute(
            name: PlantScanner.routeName,
            path: '/plantscanner',
            builder: (context, state) =>
                PlantScanner(pageController: PageController()),
          ),
          GoRoute(
            name: Profile.routeName,
            path: '/profile',
            builder: (context, state) =>
                Profile(pageController: PageController()),
          ),
          // GoRoute(
          //   name: DashboardScreen.routeName,
          //   path: '/dashboard',
          //   builder: (context, state) =>
          //       DashboardScreen(pageController: PageController()),
          // ),
        ])
  ]);
}
