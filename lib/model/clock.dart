import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String currTime = "How's moon ?";
  String currDate = "";
  var timer;

  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _clock());
    // calculateMoonPhase(DateTime.now().);
    //currDate = DateFormat('EEE d MMM').format(DateTime.now());
    currDate=  DateFormat("y年 M月 d日").format(DateTime.now());
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void _clock() {
    setState(() {
      currTime = DateFormat('kk:mm:ss').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            currTime,
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 50),
          ),
          Text(
            currDate,
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
          ),
        ],
      ),
    );
  }
}