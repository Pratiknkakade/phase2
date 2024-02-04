import 'package:flutter/material.dart';

class WorkerListProvider with ChangeNotifier {
  List<Worker> workerlist = [];
  List<String> mobilenumberlist = [];
  List<String> listofskill = [];
  String numberErrorText = '';
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController postcontroller = TextEditingController();
  final TextEditingController mobilecontroller = TextEditingController();
  final TextEditingController skillcontroller = TextEditingController();
  void addWorkerList() {
    workerlist.add(Worker(
      name: namecontroller.text,
      post: postcontroller.text,
      mobile: mobilenumberlist,
      skill: listofskill,
    ));
    namecontroller.text = "";
    postcontroller.text = '';

    notifyListeners();
  }

  void validateNumber(String input) {
    if (input.length != 10) {
      numberErrorText = ' number must be 10 digit';
    } else {
      numberErrorText = '';
    }
    notifyListeners();
  }

  void addnumber() {
    mobilenumberlist.add(mobilecontroller.text);
    notifyListeners();
  }

  void removeChip(int index) {
    mobilenumberlist.removeAt(index);
    notifyListeners();
  }

  void addskill() {
    listofskill.add(skillcontroller.text);
    notifyListeners();
  }

  void listinfo(int str) {
    namecontroller.text = workerlist[str].name;
    postcontroller.text = workerlist[str].post;
    mobilecontroller.text = workerlist[str].mobile.toString();
    skillcontroller.text = workerlist[str].skill.toString();

    notifyListeners();
  }
}

class Worker {
  String name;
  String post;
  List<String> mobile = [];
  List<String> skill = [];
  Worker({
    required this.name,
    required this.post,
    required this.mobile,
    required this.skill,
  });
}
