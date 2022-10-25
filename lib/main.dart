import 'package:flutter/material.dart';
import 'package:sola/UI/screen.dart';
import 'package:sola/component/bottm/bottom_navy_bar.dart';
import 'package:sola/UI/calendar_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Screen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   int currentIndex = 0;
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), 
//       bottomNavigationBar: BottomNavyBar(
//         selectedIndex: currentIndex,
//         showElevation: true,
//         itemCornerRadius: 24,
//         curve: Curves.easeIn,
//         onItemSelected: (index) => setState(() => currentIndex = index),
//         items: <BottomNavyBarItem>[
//           BottomNavyBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Home'),
//             activeColor: Colors.red,
//             textAlign: TextAlign.center,
//           ),
//           BottomNavyBarItem(
//             icon: Icon(Icons.sunny),
//             title: Text('Weather'),
//             activeColor: Colors.blue,
//             textAlign: TextAlign.center,
//           ),
//           BottomNavyBarItem(
//             icon: Icon(Icons.calendar_month),
//             title: Text('Calender'),
//             activeColor: Colors.pink,
//             textAlign: TextAlign.center,
//           ),
//           BottomNavyBarItem(
//             icon: Icon(Icons.settings),
//             title: Text('Settings'),
//             activeColor: Color.fromARGB(255, 13, 72, 161),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
