import 'package:flutter/material.dart';
import 'package:phase2/listwork/StudentList.dart';
import 'package:phase2/listwork/StudentListProvider.dart';
import 'package:provider/provider.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final studentListProvider = Provider.of<StudentListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add student"),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: studentListProvider.namecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            studentListProvider
                .addElementToList(studentListProvider.namecontroller.text);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => StudentList()),
            );
          },
          child: Icon(Icons.add)),
    );
  }
}
