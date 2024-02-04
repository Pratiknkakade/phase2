import 'package:flutter/material.dart';
import 'package:phase2/FirebaseExample/SimpleExample/DataProvider.dart';
import 'package:provider/provider.dart';

class AddName extends StatelessWidget {
  const AddName({super.key});

  @override
  Widget build(BuildContext context) {
    final dataprovider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(' add name ')),
      body: Column(children: [
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: dataprovider.namecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            )),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dataprovider.insertData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
