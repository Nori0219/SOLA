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
    return Consumer<ConfigInit>(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SwitchWidget(
                    title: 'ダークモード切替',
                    value: config.isDarkSwitch,
                    icon: Icon(Icons.lightbulb_outline),
                    onChanged: config.isAutoDarkSwitch //ダークモード自動切替がonなら操作禁止
                        ? null
                        : (bool value) {
                            Provider.of<MyTheme>(context, listen: false)
                                .toggle();
                            Provider.of<ConfigInit>(context, listen: false)
                                .toggle_dark_switch();
                          },
                  ),
                  SwitchWidget(
                    title: 'ダークモード自動切替',
                    value: config.isAutoDarkSwitch,
                    icon: Icon(Icons.lightbulb_outline),
                    onChanged: config.isDarkSwitch //ダークモード切替がonなら操作禁止
                        ? null
                        : (bool value) {
                            Provider.of<MyTheme>(context, listen: false)
                                .auto_toggle();
                            Provider.of<ConfigInit>(context, listen: false)
                                .auto_toggle_dark_switch();
                          },
                  ),
                ],
              ),
            ),
          );
        },
      );
  }
}
