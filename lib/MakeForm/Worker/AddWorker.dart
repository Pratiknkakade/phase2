import 'package:flutter/material.dart';
import 'package:phase2/MakeForm/Worker/WorkerList.dart';
import 'package:phase2/MakeForm/Worker/WorkerListProvider.dart';
import 'package:provider/provider.dart';

class AddWorker extends StatelessWidget {
  const AddWorker({super.key});

  @override
  Widget build(BuildContext context) {
    final workerlistprovider = Provider.of<WorkerListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Worker"),
      ),
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
                  labelText: 'post ',
                ),
              )),
          Container(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: workerlistprovider.mobilenumberlist.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(2),
                    child: Chip(
                      label: Text(workerlistprovider.mobilenumberlist[index]
                          .toString()),
                      backgroundColor: Colors.blue,
                      onDeleted: () {
                        workerlistprovider.removeChip(index);
                      },
                      labelStyle: TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  );
                }),
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: workerlistprovider.mobilecontroller,
                      onChanged: workerlistprovider.validateNumber,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobile',
                        errorText: workerlistprovider.numberErrorText.isNotEmpty
                            ? workerlistprovider.numberErrorText
                            : null,
                      ),
                    )),
              ),
              Expanded(
                  child: IconButton(
                      onPressed: () {
                        if (workerlistprovider.numberErrorText == '') {
                          workerlistprovider.addnumber();

                          workerlistprovider.mobilecontroller.text = "";
                        } else {}
                      },
                      icon: Icon(Icons.add)))
            ],
          ),
          Container(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: workerlistprovider.listofskill.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(2),
                    child: Chip(
                      label: Text(
                          workerlistprovider.listofskill[index].toString()),
                      backgroundColor: Colors.blue,
                      labelStyle: TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  );
                }),
          ),
          Row(
            children: [
              Expanded(
                  child: IconButton(
                      onPressed: () {
                        workerlistprovider.addskill();
                        workerlistprovider.skillcontroller.text = "";
                      },
                      icon: Icon(Icons.add))),
              Expanded(
                flex: 3,
                child: Container(
                    padding: const EdgeInsets.all(30),
                    child: TextField(
                      controller: workerlistprovider.skillcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'skill',
                      ),
                    )),
              ),
            ],
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            workerlistprovider.addWorkerList();
            workerlistprovider.addnumber();
            workerlistprovider.addskill();
            workerlistprovider.skillcontroller.text = "";

            workerlistprovider.mobilecontroller.text = "";

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WorkerList()),
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
