import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phase2/Vendor/AddVendor.dart';
import 'package:phase2/Vendor/UpdateVendor.dart';
import 'package:phase2/Vendor/VendorProvider.dart';
import 'package:provider/provider.dart';

class DisplayVendor extends StatelessWidget {
  const DisplayVendor({super.key});

  @override
  Widget build(BuildContext context) {
    final vendorprovider = Provider.of<VendorProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(' display vendor')),
      body: StreamBuilder<QuerySnapshot>(
        stream: vendorprovider.usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  vendorprovider.deleteFromDataBase(document.id.toString());
                  data.remove(data);
                },
                onTap: () {
                  vendorprovider.docId = document.id.toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdateVendor()),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                      child: Text(
                    data['uniccode'].toString(),
                    style: const TextStyle(fontSize: 10),
                  )),
                  title: Text(data['name']),
                  subtitle: Text(data['companyname']),
                  trailing: Text(data['adderss']),
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
            MaterialPageRoute(builder: (context) => const AddVendor()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
