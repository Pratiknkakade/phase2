import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phase2/FirebaseExample/EmpAdd.dart';

class EmpList extends StatefulWidget {
  const EmpList({super.key});

  @override
  State<EmpList> createState() => _EmpListState();
}

class _EmpListState extends State<EmpList> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('employeecolection').snapshots();

  Future<void> updateStatus(bool val, String id) async {
    FirebaseFirestore.instance.collection('employeecolection').doc(id).update({
      'status': val,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: const Text('Employe list ')),
          body: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return InkWell(
                    onLongPress: () {
                      setState(() {
                        deleteFromDataBase(document.id.toString());
                        data.remove(data);
                      });
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                          child: Text(
                        data['empid'].toString(),
                        style: const TextStyle(fontSize: 10),
                      )),
                      title: Text(data['name']),
                      subtitle: Text(data['post']),
                      trailing: Switch(
                        // This bool value toggles the switch.
                        value: data['status'],
                        activeColor: Colors.black,
                        onChanged: (bool val) {
                          updateStatus(val, document.id.toString());
                        },
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EmpAdd()),
              );
            },
            child: const Icon(Icons.add),
          )),
    );
  }

  void deleteFromDataBase(String id) async {
    FirebaseFirestore.instance.collection("employeecolection").doc(id).delete();
  }
}























// void deleteFromDataBase(String id) async {
//   FirebaseFirestore.instance.collection("employeecolection").doc(id).delete();
// }


















