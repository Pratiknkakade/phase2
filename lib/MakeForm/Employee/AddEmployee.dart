import 'package:flutter/material.dart';
import 'package:phase2/MakeForm/Employee/EmployeeList.dart';
import 'package:phase2/MakeForm/Employee/EmployeeListProvider.dart';
import 'package:provider/provider.dart';

class AddEmployee extends StatelessWidget {
  const AddEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    final employeelistprovider = Provider.of<EmployeeListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add student"),
      ),
      body: Center(
          child: ListView(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: employeelistprovider.namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              )),
          Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: employeelistprovider.postcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'post ',
                ),
              )),
          Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: employeelistprovider.salarycontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'salary',
                ),
              )),
          Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: employeelistprovider.idcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'id',
                ),
              )),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            employeelistprovider.addEmployeetoList();

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const EmployeeList()),
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
