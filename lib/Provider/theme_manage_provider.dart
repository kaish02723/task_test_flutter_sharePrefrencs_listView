import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  ThemeMode _theme=ThemeMode.light;
  ThemeMode get currentTheme=>_theme;

  clickToggle(){
    bool isCheck=_theme==ThemeMode.dark;
    if(isCheck){
      _theme=ThemeMode.light;
    }
    else{
      _theme=ThemeMode.dark;
    }
    notifyListeners();
  }
}