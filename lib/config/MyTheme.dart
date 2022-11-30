import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class MyTheme extends ChangeNotifier {
  ThemeData current = ThemeData.light();
  bool _isDark = false; //ダークモードon,off
  bool _isAutoDark = false; //ダークモード自動on,off

  MyTheme() {
    _init();
  }

  ThemeData get mode => current;
  bool get isDark => _isDark;
  bool get isAutoDark => _isAutoDark;

  void _init() async {
    final pref = await SharedPreferences.getInstance();
    _isDark = pref.getBool('isDark') ?? false;
    _isAutoDark = pref.getBool('isAutoDark') ?? false;
    //アプリ起動時に、ダークモード自動切替がonなら時間を取得して、モード変更を行う。
    if (_isAutoDark) {
      await current_time();
      //offならダークモード切替に従いモード変更
    } else {
      current = _isDark ? ThemeData.dark() : ThemeData.light();
      notifyListeners();
    }
  }

  toggle() async {
    _isDark = !_isDark;
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isDark', _isDark);
    current = _isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  current_time() async {
    var now = DateTime.now();
    var timeFormat = DateFormat('HH'); //現在時刻[hour]を取得
    var currentTime = timeFormat.format(now);
    var current_time_int = int.parse(currentTime); //intに変換
    //6-20時の間はライトモード
    if (current_time_int >= 6 && current_time_int <= 20) {
      current = ThemeData.light();
    } else {
      current = ThemeData.dark();
    }
    notifyListeners();
  }

  auto_toggle() async {
    _isAutoDark = !_isAutoDark;
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isAutoDark', _isAutoDark);
    //ダークモード自動切替をonにしたら一度現在時刻を取得し判定しモード切替を行う
    if (_isAutoDark == true) {
      await current_time();
    } else {
      current = ThemeData.light();
    }
    notifyListeners();
  }
}
