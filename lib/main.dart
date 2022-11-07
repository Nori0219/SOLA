import 'package:flutter/material.dart';
import 'package:sola/Constants/constants.dart';
import 'package:sola/UI/calendar.dart';
import 'package:sola/UI/home_page.dart';
import 'package:sola/UI/moon_page.dart';
import 'package:sola/UI/screen.dart';
import 'package:sola/UI/widgets/splash_screen.dart';
import 'package:sola/component/bottm/bottom_navy_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode mode = ThemeMode.system;
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primaryColor: Colors.blue,
      // ),
      //theme: ThemeData.dark(  ),
      theme: ThemeData.light(), // ライト用テーマ
      darkTheme: ThemeData.dark(),
      themeMode: mode,
      routes: <String, WidgetBuilder>{
        MAIN_UI: ( context) => HomePage(),
        SPLASH_SCREEN: (context) => AnimatedSplashScreen(),
        '/moon':(context) => MoonPage(),
        '/calendar':(context) => CalendarScreen(),


      },
      initialRoute: SPLASH_SCREEN,
      home: const Screen(),
    );
  }
}