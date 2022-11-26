import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:sola/config/MyTheme.dart';
import 'package:sola/config/config_init.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sola/UI/widgets/switch_widget.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConfigInit(),
      child: Consumer<ConfigInit>(
        builder: (context, config, _) {
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
                  SwitchWidget(
                    title: 'ダークモード',
                    value: config.isDarkSwitch,
                    icon: Icon(Icons.lightbulb_outline),
                    onChanged: (bool value) {
                      Provider.of<MyTheme>(context, listen: false).toggle();
                      Provider.of<ConfigInit>(context, listen: false)
                          .toggle_dark_switch();
                    },
                    //テスト
                  ),
                  Text('スイッチテスト用'),
                  SwitchWidget(
                      title: '☆テストだよ☆',
                      value: config.isTestSwitch,
                      icon: Icon(Icons.info),
                      onChanged: (bool value) {
                        Provider.of<ConfigInit>(context, listen: false)
                            .toggle_test_switch();
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
