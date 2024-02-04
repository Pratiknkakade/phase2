import 'package:flutter/material.dart';
import 'package:phase2/MakeForm/Worker/AddWorker.dart';
import 'package:phase2/MakeForm/Worker/WorkerInfo.dart';
import 'package:phase2/MakeForm/Worker/WorkerListProvider.dart';
import 'package:provider/provider.dart';

class WorkerList extends StatelessWidget {
  const WorkerList({super.key});

  @override
  Widget build(BuildContext context) {
    final workerlistprovider = Provider.of<WorkerListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Worker List "),
      ),
      body: ListView.builder(
        itemCount: workerlistprovider.workerlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                workerlistprovider.workerlist[index].post.toString(),
                style: TextStyle(fontSize: 10),
              ),
            ),
            title: Text(workerlistprovider.workerlist[index].name),
            onTap: () {
              workerlistprovider.listinfo(index);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorkerInfo()),
              );
            },
            subtitle:
                Text('mobile:${workerlistprovider.workerlist[index].mobile}'),
            trailing:
                Text(workerlistprovider.workerlist[index].skill.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AddWorker()),
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
