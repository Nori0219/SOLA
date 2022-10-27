import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moon_phase/moon_widget.dart';

class MoonPage extends StatefulWidget {
  const MoonPage({super.key});

  @override
  State<MoonPage> createState() => _MoonPageState();
}

class _MoonPageState extends State<MoonPage> {

  TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);
  bool iosStyle = true;

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Popup Picker Style",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  _time.format(context),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
              
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MoonWidget(
                      date: DateTime.now(),
                      resolution: 100,
                      size: 50,
                      moonColor: Color.fromARGB(255, 230, 174, 32),
                      earthshineColor: Colors.blueGrey.shade900,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}