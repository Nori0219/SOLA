import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sola/Constants/constants.dart';
import 'package:sola/UI/calendar.dart';
import 'package:sola/UI/home_page.dart';
import 'package:sola/UI/introduction_page.dart';
import 'package:sola/UI/moon_page.dart';
import 'package:sola/UI/unimplemented_page.dart';
import 'package:sola/UI/widgets/introduction_widget.dart';
import 'package:sola/UI/widgets/splash_screen.dart';
import 'package:sola/component/bottm/bottom_navy_bar.dart';

void main() {
  initializeDateFormatting().then((_) =>runApp(MyApp()));
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
        '/home': ( context) => HomePage(),
        '/splash_screen': (context) => AnimatedSplashScreen(),
        '/moon':(context) => MoonPage(),
        '/calendar':(context) => CalendarScreen(),
        '/unimplement':(context) => UnimplementedPage(),
        '/introducton':(context) => IntoductionWidget(),
        '/whatSOLA':(context) => IntroductionPage(),
      },
      initialRoute: '/splash_screen',
      home: const HomePage(),
    );
  }
}