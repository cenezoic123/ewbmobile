import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class LoginViewModel extends BaseViewModel{
  final String _title = 'Hope Nadela';
  int _counter = 0;

  String get title => _title;

  int get counter => _counter;

  onPressedCounter(){
    _counter = _counter + 20;
    notifyListeners();
  }
}