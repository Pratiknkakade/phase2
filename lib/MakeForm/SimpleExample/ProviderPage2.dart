import 'package:flutter/material.dart';
import 'package:phase2/MakeForm/SimpleExample/ProviderPage1.dart';
import 'package:phase2/MakeForm/SimpleExample/ProviderClass.dart';
import 'package:provider/provider.dart';

class ProviderPage2 extends StatelessWidget {
  const ProviderPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final providerClass1 = Provider.of<ProviderClass>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('page2'),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Text(providerClass1.name),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Text(providerClass1.num.toString()),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProviderPage1()),
                );
              },
              child: const Text('back'))
        ]),
      ),
    );
  }
}
