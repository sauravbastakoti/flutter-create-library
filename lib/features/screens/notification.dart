import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  final PageController pageController;
  static String routeName = 'notifications';
  const Notifications({super.key, required this.pageController});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text('data')],
      ),
    );
  }
}
