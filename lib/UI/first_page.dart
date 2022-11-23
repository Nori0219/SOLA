import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sola/UI/home_page.dart';
import 'package:sola/UI/introduction_page.dart';
import 'package:sola/UI/widgets/splash_screen.dart';

class HogeScreen extends StatelessWidget {
  Future<bool> haveSeenIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('haveSeenIntro') ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: haveSeenIntro(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return AnimatedSplashScreen();
            }

            if (snapshot.error != null) {
              return AnimatedSplashScreen();
            }
            if (snapshot.hasData) {
              return HomePage();
            } else {
              return IntroductionPage();
            }
          },
        );
    }
}