import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String _selectedLanguage = 'en';

  LanguageProvider() {
    loadLanguage();
  }

  String get selectedLanguage => _selectedLanguage;

  void setLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language", language);
    _selectedLanguage = language;
    notifyListeners();
  }

  Future<void> loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedLanguage = prefs.getString('language') ?? 'en';
    notifyListeners();
  }
}
