import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProviderIntern with ChangeNotifier {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController mobilecontroler = TextEditingController();
  final TextEditingController collegecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController addharcontroller = TextEditingController();
  final TextEditingController dobcontroller = TextEditingController();
  final TextEditingController yearcontroller = TextEditingController();
  final TextEditingController feecontroller = TextEditingController();
  final TextEditingController designationcontroller = TextEditingController();
  final TextEditingController notecontroller = TextEditingController();
  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('interns').snapshots();
  String docId = '';
  String mobileErrorText = '';
  String dateErrorText = '';
  String addressErrorText = '';
  String addharErrorText = '';
  ColorLabel? selectedColor;
  //List<Intern> internList = [];

  void insertData() async {
    // internList.add(Intern(
    //   name: namecontroller.text,
    //   mobile: double.parse(mobilecontroler.text),
    //   addhar: double.parse(addharcontroller.text),
    //   address: addresscontroller.text,
    //   dob: double.parse(dobcontroller.text),
    //   college: collegecontroller.text,
    //   year: yearcontroller.text,
    //   designation: designationcontroller.text,
    //   fee: double.parse(feecontroller.text),
    //   note: notecontroller.text,
    // ));
    CollectionReference intern =
        FirebaseFirestore.instance.collection('interns');
    intern.add({
      'name': namecontroller.text,
      'mobile': int.parse(mobilecontroler.text),
      'addhar': int.parse(addharcontroller.text),
      'address': addresscontroller.text,
      'dob': dobcontroller.text,
      'college': collegecontroller.text,
      'year': yearcontroller.text,
      'designation': designationcontroller.text,
      'fee': int.parse(feecontroller.text),
      'note': notecontroller.text
    });

    namecontroller.text = '';
    mobilecontroler.text = '';
    addharcontroller.text = '';
    addresscontroller.text = '';
    dobcontroller.text = '';
    collegecontroller.text = '';
    yearcontroller.text = '';
    designationcontroller.text = '';
    feecontroller.text = '';
    notecontroller.text = '';
    notifyListeners();
  }

  Future<void> updateData(String id) async {
    FirebaseFirestore.instance.collection('interns').doc(id).update({
      'name': namecontroller.text,
      'mobile': int.parse(mobilecontroler.text),
      'addhar': int.parse(addharcontroller.text),
      'address': addresscontroller.text,
      'dob': dobcontroller.text,
      'college': collegecontroller.text,
      'year': yearcontroller.text,
      'designation': designationcontroller.text,
      'fee': int.parse(feecontroller.text),
      'note': notecontroller.text
    });
    namecontroller.text = '';
    mobilecontroler.text = '';
    addharcontroller.text = '';
    addresscontroller.text = '';
    dobcontroller.text = '';
    collegecontroller.text = '';
    yearcontroller.text = '';
    designationcontroller.text = '';
    feecontroller.text = '';
    notecontroller.text = '';
    notifyListeners();
  }

  void deleteFromDataBase(String id) async {
    FirebaseFirestore.instance.collection("interns").doc(id).delete();

    notifyListeners();
  }

  void validateMobileNumber(String input) {
    if (input.length != 10) {
      mobileErrorText = 'Number must be  1o characters';
    } else {
      mobileErrorText = '';
    }
    notifyListeners();
  }

  void validateAddharNumber(String input) {
    if (input.length != 12) {
      addharErrorText = 'Number must be 12 characters';
    } else {
      addharErrorText = '';
    }
    notifyListeners();
  }

  void validatedate(String input) {
    final dob = DateTime.parse(input);
    final currentdate = DateTime.now();
    final tenYearAgo = currentdate.subtract(Duration(days: 365 * 10));

    if (dob.isAfter(tenYearAgo)) {
      dateErrorText = 'date must be at least 10 year ago ';
    } else {
      dateErrorText = '';
    }
    notifyListeners();
  }

  void validateAddress(String input) {
    if (input.length <= 10) {
      addressErrorText = 'address must be greater tha 10 characters';
    } else {
      addressErrorText = '';
    }
    notifyListeners();
  }
}

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}
