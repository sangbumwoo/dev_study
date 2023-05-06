import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  Counter() {
    print('Counter 초기화');
  }

  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}
