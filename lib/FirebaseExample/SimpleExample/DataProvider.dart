import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  final TextEditingController namecontroller = TextEditingController();

  void insertData() async {
    CollectionReference employee =
        FirebaseFirestore.instance.collection('namee');
    employee.add({
      'name': namecontroller.text,
    });

    notifyListeners();
  }

  void getData() {
    
    notifyListeners();
  }
}
