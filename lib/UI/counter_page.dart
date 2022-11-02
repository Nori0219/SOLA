import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var  _width = MediaQuery.of(context).size.width;

    var _geo_height_positon = _height/30;
    var _geo_width_positon = _width/12;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('カウンター'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('  天体観測アプリ\nSOLAへようこそ！',style:TextStyle(fontSize: 40),),
            
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}