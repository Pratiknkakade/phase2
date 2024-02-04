import 'package:flutter/material.dart';

class ProviderClass with ChangeNotifier {
  String name = '';
  int num = 0;
  //String number = '';
  void setName(String str) {
    name = str;

    notifyListeners();
  }

  void setNum(int n) {
    num = n;

    notifyListeners();
  }
}
