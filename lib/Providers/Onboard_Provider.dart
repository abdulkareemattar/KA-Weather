
import 'package:flutter/material.dart';

class OnboardProvider extends ChangeNotifier{
  int _currentPage=0;
  int get currentPage => _currentPage;
  void setCurPage(int page){
    _currentPage=page;
    notifyListeners();
  }
}