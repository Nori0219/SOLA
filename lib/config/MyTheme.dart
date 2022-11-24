import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyTheme extends ChangeNotifier {
  ThemeData current = ThemeData.light();
  bool _isDark = false;
  MyTheme() {
    _init();
  }

  ThemeData get mode => current;

  void _init() async {
    final pref = await SharedPreferences.getInstance();
    _isDark = pref.getBool('isDark') ?? false;
    current = _isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  // とりあえずトグルでテーマを切り替える関数だけ定義しています
  toggle() async {
    _isDark = !_isDark;
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isDark', _isDark);
    current = _isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}
