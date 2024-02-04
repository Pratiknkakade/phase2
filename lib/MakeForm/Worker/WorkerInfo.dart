import 'package:flutter/material.dart';
import 'package:phase2/MakeForm/Worker/WorkerList.dart';
import 'package:phase2/MakeForm/Worker/WorkerListProvider.dart';
import 'package:provider/provider.dart';

class WorkerInfo extends StatelessWidget {
  const WorkerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final workerlistprovider = Provider.of<WorkerListProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Worker information')),
      body: Center(
        child: ListView(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: workerlistprovider.namecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: workerlistprovider.postcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'post',
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: workerlistprovider.mobilecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'mobile',
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: workerlistprovider.skillcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'skill',
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WorkerList()),
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
