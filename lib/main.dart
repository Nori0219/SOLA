import 'package:flutter/material.dart';
import 'package:sola/UI/moon_page.dart';
import 'package:sola/UI/screen.dart';
import 'package:sola/component/bottm/bottom_navy_bar.dart';
import 'package:sola/UI/calendar_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primaryColor: Colors.blue,
      // ),
      theme: ThemeData.dark(  ),
      routes: <String, WidgetBuilder>{
        //MAIN_UI: (BuildContext context) => MainUI(),
        //SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
        '/moon':(context) => MoonPage(),


      },
      //initialRoute: SPLASH_SCREEN,
      home: const Screen(),
    );
  }
}