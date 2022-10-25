import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sola/UI/calendar.dart';
import 'package:sola/UI/calendar_page.dart';
import 'package:sola/UI/counter_page.dart';
import 'package:sola/component/bottm/bottom_navy_bar.dart';
import 'package:sola/UI/calendar.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int currentIndex = 0;
  List<Widget> PageList = [CounterPage(),CalendarScreen(),CalendarPage('カレンダー'),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageList[currentIndex],
      bottomNavigationBar: BottomNavyBar(
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
          BottomNavyBarItem(
            icon: Icon(Icons.sunny),
            title: Text('Weather'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.calendar_month),
            title: Text('Calender'),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
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