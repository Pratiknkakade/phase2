import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VendorProvider with ChangeNotifier {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController companynamecontroler = TextEditingController();
  final TextEditingController servicecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController uniccodecontroller = TextEditingController();
  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('vendor').snapshots();
  String docId = '';

  void insertData() async {
    CollectionReference vender =
        FirebaseFirestore.instance.collection('vendor');
    vender.add({
      'name': namecontroller.text,
      'companyname': companynamecontroler.text,
      'service': servicecontroller.text,
      'adderss': addresscontroller.text,
      'uniccode': uniccodecontroller.text,
    });

    namecontroller.text = '';
    companynamecontroler.text = '';
    servicecontroller.text = '';
    uniccodecontroller.text = '';
    addresscontroller.text = '';
    notifyListeners();
  }

  Future<void> updateData(String id) async {
    FirebaseFirestore.instance.collection('vendor').doc(id).update({
      'name': namecontroller.text,
      'companyname': companynamecontroler.text,
      'service': servicecontroller.text,
      'adderss': addresscontroller.text,
      'uniccode': uniccodecontroller.text,
    });
    namecontroller.text = '';
    companynamecontroler.text = '';
    servicecontroller.text = '';
    uniccodecontroller.text = '';
    addresscontroller.text = '';
    notifyListeners();
  }

  void deleteFromDataBase(String id) async {
    FirebaseFirestore.instance.collection("vendor").doc(id).delete();

    notifyListeners();
  }
}
