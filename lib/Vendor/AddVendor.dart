import 'package:flutter/material.dart';
import 'package:phase2/Vendor/VendorProvider.dart';
import 'package:provider/provider.dart';

class AddVendor extends StatelessWidget {
  const AddVendor({super.key});

  @override
  Widget build(BuildContext context) {
    final vendorprovider = Provider.of<VendorProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(' Add vendor')),
      body: Column(children: [
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
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: vendorprovider.servicecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'service',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: vendorprovider.addresscontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'address',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: vendorprovider.uniccodecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'unic code',
              ),
            )),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vendorprovider.insertData();
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
