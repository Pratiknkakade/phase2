import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phase2/Interns/AddIntern.dart';
import 'package:phase2/Interns/ProviderIntern.dart';
import 'package:phase2/Interns/UpdateIntern.dart';
import 'package:provider/provider.dart';

class ViewIntern extends StatelessWidget {
  const ViewIntern({super.key});

  @override
  Widget build(BuildContext context) {
    final providerintern = Provider.of<ProviderIntern>(context);

    return Scaffold(
      appBar: AppBar(title: Text(' view intern')),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: providerintern.usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return InkWell(
                  onLongPress: () {
                    providerintern.deleteFromDataBase(document.id.toString());
                    data.remove(data);
                  },
                  onTap: () {
                    providerintern.docId = document.id.toString();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdateIntern()),
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Text(
                      data['year'].toString(),
                      style: const TextStyle(fontSize: 10),
                    )),
                    title: Text(data['name']),
                    subtitle: Text(data['mobile'].toString()),
                    trailing: Text(data['address']),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddIntern()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
