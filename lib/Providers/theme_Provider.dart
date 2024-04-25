import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier
{
  ThemeProvider(){
    getTheme();
  }
  Brightness _thememode =Brightness.light;
  Brightness get thememode => _thememode;
  void changeTheme (String thememode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('thememode', thememode);
    _thememode= thememode == 'Brightness.light' ? Brightness.light : Brightness.dark;
    notifyListeners();
  }
  Future<void> getTheme ()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String themeString = prefs.getString('thememode') ?? 'Brightness.light';
    _thememode= themeString == 'Brightness.light' ? Brightness.light : Brightness.dark;
    notifyListeners();
  }
}