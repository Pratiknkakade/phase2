import 'package:flutter/material.dart';
import 'package:phase2/MakeForm/SimpleExample/ProviderClass.dart';
import 'package:phase2/MakeForm/SimpleExample/ProviderPage2.dart';
import 'package:provider/provider.dart';

class ProviderPage1 extends StatelessWidget {
  ProviderPage1({super.key});
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final providerClass = Provider.of<ProviderClass>(context);
    namecontroller.text = providerClass.name;
    numbercontroller.text = providerClass.num.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: namecontroller,
                onChanged: (name) {
                  providerClass.setName(name);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: numbercontroller,
                onChanged: (number) {
                  providerClass.setNum(int.parse(number));
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'number',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProviderPage2()),
                  );
                },
                child: const Text('go to page 2'))
          ],
        ),
      ),
    );
  }
}
