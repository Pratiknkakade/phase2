import 'package:flutter/material.dart';

class StudentListProvider with ChangeNotifier {
  List<String> studentList = [];
  final TextEditingController namecontroller = TextEditingController();

  void addElementToList(String name) {
    studentList.add(name);
    namecontroller.text = "";
    notifyListeners();
  }
}
