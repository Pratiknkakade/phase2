import 'package:flutter/material.dart';
import 'package:phase2/MakeForm/Employee/AddEmployee.dart';
import 'package:phase2/MakeForm/Employee/EmployeeListProvider.dart';
import 'package:provider/provider.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key});

  @override
  Widget build(BuildContext context) {
    final employeelistprovider = Provider.of<EmployeeListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Student List "),
      ),
      body: ListView.builder(
        itemCount: employeelistprovider.employeeList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                employeelistprovider.employeeList[index].id.toString(),
                style: TextStyle(fontSize: 10),
              ),
            ),
            title: Text(employeelistprovider.employeeList[index].name),
            subtitle: Text(
                'salary:${employeelistprovider.employeeList[index].salary}'),
            trailing: Text(employeelistprovider.employeeList[index].post),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AddEmployee()),
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
