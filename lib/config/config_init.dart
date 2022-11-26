import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
設定ページの設定をDBに保存する。
*/
class ConfigInit extends ChangeNotifier {
  bool _isDarkSwitch = false;
  //test
  bool _isTestSwitch = false;

  ConfigInit() {
    _init();
  }

  bool get isDarkSwitch => _isDarkSwitch;
  //test
  bool get isTestSwitch => _isTestSwitch;

  void _init() async {
    final pref = await SharedPreferences.getInstance();
    _isDarkSwitch = pref.getBool('isDarkSwitch') ?? false;
    _isTestSwitch = pref.getBool('isTestSwitch') ?? false;

    notifyListeners();
  }

  toggle_dark_switch() async {
    _isDarkSwitch = !_isDarkSwitch;
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isDarkSwitch', _isDarkSwitch);
    notifyListeners();
  }

  //テスト

  toggle_test_switch() async {
    _isTestSwitch = !_isTestSwitch;
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isTestSwitch', _isTestSwitch);
    notifyListeners();
  }
}
