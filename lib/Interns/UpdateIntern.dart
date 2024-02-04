import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phase2/Interns/ProviderIntern.dart';
import 'package:provider/provider.dart';

class UpdateIntern extends StatelessWidget {
  const UpdateIntern({super.key});

  @override
  Widget build(BuildContext context) {
    final providerintern = Provider.of<ProviderIntern>(context);
    CollectionReference users =
        FirebaseFirestore.instance.collection('interns');
    return Scaffold(
      appBar: AppBar(title: const Text(' update intern')),
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: users.doc(providerintern.docId).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              providerintern.namecontroller.text = data['name'];
              providerintern.addresscontroller.text = data['address'];
              providerintern.addharcontroller.text = data['addhar'].toString();
              providerintern.mobilecontroler.text = data['mobile'].toString();
              providerintern.yearcontroller.text = data['year'];
              providerintern.notecontroller.text = data['note'];
              providerintern.feecontroller.text = data['fee'].toString();
              providerintern.designationcontroller.text = data['designation'];
              providerintern.dobcontroller.text = data['dob'];
              providerintern.collegecontroller.text = data['college'];

              return ListView(children: [
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: providerintern.namecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: providerintern.addresscontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'address',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: providerintern.mobilecontroler,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'mobile number',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: providerintern.dobcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'date of birth',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: providerintern.addharcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'addhar number',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: providerintern.collegecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'college name ',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: providerintern.yearcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ' year of study ',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: providerintern.designationcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ' designation ',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: providerintern.feecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ' paid fee ',
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: providerintern.notecontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: ' note ',
                      ),
                    )),
              ]);
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          providerintern.updateData(providerintern.docId);
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
