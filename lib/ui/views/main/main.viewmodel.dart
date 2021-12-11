import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class MainViewModel extends BaseViewModel{
  final String _title = 'Main View';
  int _counter = 0;

  String get title => _title;

  int get counter => _counter;

  onPressedCounter(){
    _counter = _counter + 3;
    notifyListeners();
  }
}