import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final PageController pageController;
  static String routeName = 'profile';
  const Profile({super.key, required this.pageController});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('profile'),
    ));
  }
}
