import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:moon_phase/moon_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key,}) : super(key: key);


  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  Map<DateTime, List> _eventsList = {};

  DateTime _focused = DateTime.now();
  DateTime? _selected;

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();

    _selected = _focused;
    _eventsList = {
     // DateTime.now().subtract(Duration(days: 2)): ['Test A', 'Test B'],
      DateTime.now(): ['皆既月食観望会', ],
      
    };
  }
  
  @override
  Widget build(BuildContext context) {
    final _list = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEvent(DateTime day) {
      return _list[day] ?? [];
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Column(children: [
          TableCalendar(
            firstDay: DateTime.utc(2022, 4, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            eventLoader: getEvent, //追記
            selectedDayPredicate: (day) {
              return isSameDay(_selected, day);
            },
            onDaySelected: (selected, focused) {
              if (!isSameDay(_selected, selected)) {
                setState(() {
                  _selected = selected;
                  _focused = focused;
                });
              }
            },
            focusedDay: _focused,
          ),
          //--追記--------------------------------------------------------------
          ListView(
            shrinkWrap: true,
            children: getEvent(_selected!)
                .map((event) => ListTile(
                      title: Text(event.toString()),
                    ))
                .toList(),
          )
          //--------------------------------------------------------------------
        ]));
  }
}

_moonPhases() {
    var _list = <Widget>[];
    for (int i = 0; i < 30 * (24 / 12); i++) {
      _list.add(
        MoonWidget(
          date: DateTime.now().add(Duration(hours: i * 12)),
          resolution: 64,
          size: 48,
          moonColor: Colors.amber,
          earthshineColor: Colors.blueGrey.shade900,
        ),
      );
    }
    return _list;
  }