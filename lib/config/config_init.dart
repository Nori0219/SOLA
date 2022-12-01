import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sola/config/MyTheme.dart';

/*
設定ページの設定をDBに保存する。
*/
class ConfigInit extends ChangeNotifier {
  bool _isDarkSwitch = false; //ダークモード切替のスイッチon,off
  bool _isAutoDarkSwitch = false; //ダークモード自動切替のスイッチon,off

  ConfigInit() {
    _init();
  }

  bool get isDarkSwitch => _isDarkSwitch;
  bool get isAutoDarkSwitch => _isAutoDarkSwitch;

  void _init() async {
    final pref = await SharedPreferences.getInstance();
    _isDarkSwitch = pref.getBool('isDarkSwitch') ?? false;
    _isAutoDarkSwitch = pref.getBool('isAutoDarkSwitch') ?? false;
    notifyListeners();
  }

  toggle_dark_switch() async {
    _isDarkSwitch = !_isDarkSwitch;
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isDarkSwitch', _isDarkSwitch);
    notifyListeners();
  }

  auto_toggle_dark_switch() async {
    _isAutoDarkSwitch = !_isAutoDarkSwitch;
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isAutoDarkSwitch', _isAutoDarkSwitch);
    notifyListeners();
  }
}
