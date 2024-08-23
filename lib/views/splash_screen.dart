import 'dart:async';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greatticket/core/shared_prefences/locator.dart';
import 'package:greatticket/core/shared_prefences/shared_prefences_service.dart';
import 'package:greatticket/features/login_register/login_screen.dart';
import 'package:greatticket/resources/ui_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    whereToGo();
    // Timer(const Duration(seconds: 5),) {
    //   Get.to(LoginScreen());
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void whereToGo() async {
    Timer(const Duration(seconds: 5), () {
      context.goNamed(LoginScreen.routeName);
    });

    String? token = locator.get<SharedPreferencesService>().token;
    Timer(const Duration(seconds: 5), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // backgroundColor: Theme.of(context).brightness == Brightness.dark
      //     ? primaryColor
      //     : mobileBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 10,
            ),
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Image.asset(
                      UiAssets.log,
                      width: 300,
                      height: 300,
                    )

                    // Image.asset(
                    //   Theme.of(context).brightness == Brightness.dark
                    //       ? UiAssets //'assets/dealslogo.png'
                    //       : UiAssets, //'assets/dealslogob.png',
                    // ),
                    ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Powered by ',
                    style: GoogleFonts.montserrat(
                      fontSize: MediaQuery.of(context).size.width / 30,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Krishi Kanti',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 4,
                // ),
                // Image.asset(
                //   Theme.of(context).brightness == Brightness.dark
                //       ? UiAssets.logomain //'assets/logomain.png'
                //       : UiAssets.moreTech, // 'assets/111.png',
                //   height: 100,
                //   width: 100,
                // ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '2023',
                      style: TextStyle(),
                    ),
                    Icon(
                      Icons.copyright,
                      size: 15,
                    ),
                    Text(
                      'Company Name. All Rights Reserved',
                      style: TextStyle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
