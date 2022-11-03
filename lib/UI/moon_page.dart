import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:moon_phase/moon_widget.dart';
import 'package:sola/model/clock.dart';

class MoonPage extends StatefulWidget {
  const MoonPage({super.key});

  @override
  State<MoonPage> createState() => _MoonPageState();
}

class _MoonPageState extends State<MoonPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:  Color.fromARGB(255, 2, 0, 25),
      body: SafeArea(
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Clock(),
                  Moon_widget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Moon_widget extends StatelessWidget {
  const Moon_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var _height = MediaQuery.of(context).size.height;
    var  _width = MediaQuery.of(context).size.width;

    return Container(
      //color: Colors.blue,
      height: _height / 2.5,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: MoonWidget(
              date: DateTime.now(),
              resolution:800,
              //size: _width / 2.5,
              size: _height / 4.5,
              moonColor: Color.fromARGB(255, 228, 195, 109),
              earthshineColor: Color.fromARGB(255, 42, 41, 41),
            ),
          ),
          Positioned(
            right: _width/12,
            top: _height /30,
            child: SizedBox( height:_height / 6, child: Lottie.asset('assets/images/107299-satellite-moon-astronaut.json')),
            //宇宙飛行士
          ),
          Positioned(
            left: _width/30,
            height:_height / 4.5, 
            child: Lottie.asset('assets/images/89629-moon-without-stars.json')//隕石
          ),
        ],
      ),
    );
  }
}