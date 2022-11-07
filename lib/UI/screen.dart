import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sola/UI/calendar.dart';
import 'package:sola/UI/counter_page.dart';
import 'package:sola/UI/home_page.dart';
import 'package:sola/UI/moon_page.dart';
import 'package:sola/component/bottm/bottom_navy_bar.dart';
import 'package:sola/UI/calendar.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int currentIndex = 0;
  List<Widget> PageList = [HomePage(),CounterPage(),];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: PageList[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black87,
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          // BottomNavyBarItem(
          //   icon: Icon(Icons.cloud),
          //   title: Text('Moon'),
          //   activeColor: Colors.orange,
          //   textAlign: TextAlign.center,
          // ),
          // BottomNavyBarItem(
          //   icon: Icon(Icons.home_max_outlined),
          //   title: Text('HOME'),
          //   activeColor: Colors.blue,
          //   textAlign: TextAlign.center,
          // ),
          // BottomNavyBarItem(
          //   icon: Icon(Icons.calendar_month),
          //   title: Text('Calender'),
          //   activeColor: Colors.pink,
          //   textAlign: TextAlign.center,
          // ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Color.fromARGB(255, 13, 72, 161),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}