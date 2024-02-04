import 'package:flutter/material.dart';
import 'package:phase2/MakeForm/Employee/Employee.dart';

class EmployeeListProvider with ChangeNotifier {
  List<Employee> employeeList = [];
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController postcontroller = TextEditingController();
  final TextEditingController salarycontroller = TextEditingController();
  final TextEditingController idcontroller = TextEditingController();

  void addEmployeetoList() {
    employeeList.add(Employee(
        name: namecontroller.text,
        post: postcontroller.text,
        salary: int.parse(salarycontroller.text),
        id: int.parse(idcontroller.text)));
    namecontroller.text = "";
    postcontroller.text = '';
    salarycontroller.text = '';
    idcontroller.text = '';
    notifyListeners();
  }
}
