import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:sola/config/MyTheme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}
class _ConfigPageState extends State<ConfigPage> {

  @override
  Widget build(BuildContext context) {
    
    //毎回ページで変数定義してるから受け渡しできるように書き換える必要あり
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      
      appBar: AppBar(
        title: const Text('設定'),
        backgroundColor: Colors.blueAccent.withOpacity(0.5),
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('テーマ切替テスト'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<MyTheme>(context, listen: false).toggle();
        },
        child: Icon(Icons.autorenew),
      ),
    );
  }
}
