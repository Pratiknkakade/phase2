import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phase2/Vendor/VendorProvider.dart';
import 'package:provider/provider.dart';

class UpdateVendor extends StatelessWidget {
  const UpdateVendor({super.key});

  @override
  Widget build(BuildContext context) {
    final vendorprovider = Provider.of<VendorProvider>(context);
    CollectionReference users = FirebaseFirestore.instance.collection('vendor');
    return Scaffold(
      appBar: AppBar(title: Text(' update Vendor')),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(vendorprovider.docId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            vendorprovider.namecontroller.text = data['name'];
            vendorprovider.companynamecontroler.text = data['companyname'];
            vendorprovider.addresscontroller.text = data['adderss'];
            vendorprovider.servicecontroller.text = data['service'];
            vendorprovider.uniccodecontroller.text = data['uniccode'];
            return Column(children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: vendorprovider.namecontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  )),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: vendorprovider.companynamecontroler,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'company name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: vendorprovider.servicecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'service',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: vendorprovider.addresscontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'address',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: vendorprovider.uniccodecontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'uniccode',
                  ),
                ),
              )
            ]);
          }

          return Text("loading");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vendorprovider.updateData(vendorprovider.docId);
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
