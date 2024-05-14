import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{
  var _thememode=ThemeMode.light;

  ThemeMode get thememode=>_thememode;

  void setTheme(thememode){
    _thememode=thememode;
    notifyListeners();
  }
}