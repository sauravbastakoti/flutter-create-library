import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:greatticket/features/screens/dashboard.dart';
import 'package:greatticket/features/screens/event.dart';
import 'package:greatticket/features/screens/profile.dart';
import 'package:greatticket/features/screens/scan.dart';

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
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(70),
      //   child: AppBar(
      //     elevation: 4,
      //     title: Row(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(left: 10, right: 5),
      //           child: Image.asset(
      //             Theme.of(context).brightness == Brightness.dark
      //                 ? 'assets/dealslogo.png'
      //                 : 'assets/dealslogob.png',
      //             height: 90,
      //             width: 90,
      //           ),
      //         ),
      //         const Spacer(),
      //         Container(
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child: Padding(
      //             padding: const EdgeInsets.only(top: 28),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   children: [
      //                     const Text(
      //                       '🇸🇰',
      //                       style: TextStyle(fontSize: 20),
      //                     ),
      //                     const SizedBox(
      //                       width: 3,
      //                     ),
      //                     Text(
      //                       isPointsVisible ? ' ${'amount'}' : 'XXXX.XX',
      //                       style: const TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 16,
      //                       ),
      //                     ),
      //                     const SizedBox(
      //                       width: 4,
      //                     ),
      //                     GestureDetector(
      //                         onTap: () {
      //                           setState(() {
      //                             isPointsVisible = !isPointsVisible;
      //                           });
      //                         },
      //                         child: Icon(
      //                           isPointsVisible
      //                               ? Icons.remove_red_eye_outlined
      //                               : Icons.remove_red_eye,
      //                         )),
      //                   ],
      //                 ),
      //                 Transform.translate(
      //                   offset: const Offset(0, -4),
      //                   child: const Row(
      //                     children: [
      //                       Padding(
      //                         padding: EdgeInsets.only(left: 65),
      //                         child: Text(
      //                           ' state.symbol.toString()',
      //                           style: TextStyle(
      //                               fontSize: 14,
      //                               color: Colors.purple,
      //                               fontWeight: FontWeight.bold),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        // backgroundColor: Theme.of(context).brightness == Brightness.dark
        //     ? primaryColor
        //     : mobileBackgroundColor,
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
      //   case 4:
      //     context.goNamed(DashboardScreen.routeName);
      //     break;
    }
  }
}
