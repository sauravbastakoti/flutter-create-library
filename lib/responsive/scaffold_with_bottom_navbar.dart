import 'package:KrishiKranti/features/chat/chat.dart';
import 'package:KrishiKranti/features/screens/dashboard.dart';
import 'package:KrishiKranti/features/screens/event.dart';
import 'package:KrishiKranti/features/screens/profile.dart';
import 'package:KrishiKranti/features/screens/scan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavbar extends StatefulWidget {
  const ScaffoldWithBottomNavbar({super.key, required this.child});
  final Widget child;

  @override
  _ScaffoldWithBottomNavbarState createState() =>
      _ScaffoldWithBottomNavbarState();
}

class _ScaffoldWithBottomNavbarState extends State<ScaffoldWithBottomNavbar> {
  int _selectedIndex = 0;
  bool isPointsVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1B9527),
        unselectedItemColor: const Color(0xFF706060),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          onTapped(context, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const ChatScreen());
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.chat), // Set your desired color
      ),
    );
  }

  void onTapped(
    BuildContext context,
    int index,
  ) {
    print('selected index $index');
    switch (index) {
      case 0:
        context.goNamed(DashboardScreen.routeName);
        break;
      case 1:
        context.goNamed(Categories.routeName);
        break;
      case 2:
        context.goNamed(PlantScanner.routeName);
        break;
      case 3:
        context.goNamed(Profile.routeName);
        break;
    }
  }
}
