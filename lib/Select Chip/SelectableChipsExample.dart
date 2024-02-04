import 'package:flutter/material.dart';
import 'package:phase2/Select%20Chip/ChipProvider.dart';
import 'package:provider/provider.dart';

class SelectableChipsExample extends StatelessWidget {
  const SelectableChipsExample({super.key});

  @override
  Widget build(BuildContext context) {
    final chipprovider = Provider.of<ChipProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(' select chip')),
      body: Column(
        children: [
          Container(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: chipprovider.chipList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(2),
                    child: ActionChip(
                      avatar: Icon(chipprovider.selectChipList
                              .contains(chipprovider.chipList[index])
                          ? Icons.favorite
                          : Icons.favorite_border),
                      label: Text(chipprovider.chipList[index]),
                      onPressed: () {
                        chipprovider.setVal(index);
                        // chipprovider.selectChip(index);
                        // print(chipprovider.chipList[index]);
                      },
                    ),
                  );
                }),
          ),
          Container(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: chipprovider.selectChipList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(2),
                    child: Chip(
                      label:
                          Text(chipprovider.selectChipList[index].toString()),
                      backgroundColor: Colors.blue,
                      labelStyle: TextStyle(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
