import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sola/Constants/constants.dart';
import 'package:sola/UI/home_page.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

   late AnimationController animationController;
   late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(MAIN_UI);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
           
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/icons/SOLA_icon_blue.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Padding(padding: EdgeInsets.only(bottom: 30.0),child:new Image.asset('assets/displey_images/banar_透過.png',height: 110,fit: BoxFit.scaleDown,))

            ],),
        ],
      ),
    );
  }
}