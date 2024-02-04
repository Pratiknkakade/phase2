import 'package:flutter/material.dart';
import 'package:phase2/Select%20Chip/ChipProvider.dart';
import 'package:phase2/Select%20Chip/SelectableChipsExample.dart';
import 'package:provider/provider.dart';

class AddChips extends StatelessWidget {
  const AddChips({super.key});

  @override
  Widget build(BuildContext context) {
    final chipprovider = Provider.of<ChipProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text(' add chips')),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: chipprovider.chipcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'name',
                  ),
                )),
          ),
          Expanded(
              child: IconButton(
                  onPressed: () {
                    chipprovider.addChipList();

                    chipprovider.chipcontroller.text = "";
                  },
                  icon: const Icon(Icons.add)))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SelectableChipsExample()),
            );
          },
          child: const Icon(Icons.add)),
    );
  }
}
