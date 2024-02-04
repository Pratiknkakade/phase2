import 'package:flutter/material.dart';

class ChipProvider with ChangeNotifier {
  final TextEditingController chipcontroller = TextEditingController();

  List<String> chipList = [];
  List<String> selectChipList = [];

  void setVal(int index) {
    String str = chipList[index];
    if (selectChipList.contains(str)) {
      selectChipList.remove(str);
    } else {
      selectChipList.add(str);
    }

    notifyListeners();
  }

  void addChipList() {
    chipList.add(chipcontroller.text);
    notifyListeners();
  }

  void insertList() {
    notifyListeners();
  }

  void deleteList() {
    notifyListeners();
  }
}
