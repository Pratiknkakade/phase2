import 'package:flutter/material.dart';
import 'package:phase2/listwork/AddStudent.dart';
import 'package:phase2/listwork/StudentListProvider.dart';
import 'package:provider/provider.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    final studentListProvider = Provider.of<StudentListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(" Student List "),
      ),
      body: ListView.builder(
        itemCount: studentListProvider.studentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(studentListProvider.studentList[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AddStudent()),
            );
          },
          child: Icon(Icons.add)),
    );
  }
}
