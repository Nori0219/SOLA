import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage(this.title);
  final String title;
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: TableCalendar(
        firstDay: DateTime(2020, 1, 1),
        lastDay: DateTime(2040, 12, 31),
        focusedDay: DateTime.now(),
        calendarStyle: CalendarStyle(
          defaultDecoration: BoxDecoration(
            border: Border.all(),
          ),
          todayDecoration: BoxDecoration(
            border: Border.all(),
          ),
          outsideDecoration: BoxDecoration(
            border: Border.all(),
          ),
          weekendDecoration: BoxDecoration(
            border: Border.all(),
          ),
          todayTextStyle: TextStyle(color: Colors.black),
          cellMargin: EdgeInsets.zero,
        ),
      ),
    );
  }
}