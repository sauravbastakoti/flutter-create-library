import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  final PageController pageController;
  static String routeName = '/events';
  const Events({super.key, required this.pageController});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('events'),
        ],
      ),
    );
  }
}
