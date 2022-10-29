import 'package:flutter/material.dart';
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
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData.dark(  ),
      home: const Screen(),
    );
  }
}
