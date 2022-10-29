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
      body: SafeArea(
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Clock(),
                  Container(
                    color: Colors.blue,
                    height: 330,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: MoonWidget(
                            date: DateTime.now(),
                            resolution:800,
                            size: 160,
                            moonColor: Color.fromARGB(255, 230, 183, 65),
                            earthshineColor: Color.fromARGB(255, 64, 69, 71),
                          ),
                        ),
                        Positioned(
                          right: 24,
                          top: 26,
                          child: SizedBox(height:150, child: Lottie.asset('assets/images/107299-satellite-moon-astronaut.json')),
                          
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height:190, child: Lottie.asset('assets/images/89629-moon-without-stars.json')
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}