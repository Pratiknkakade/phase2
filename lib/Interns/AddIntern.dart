import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phase2/Interns/ProviderIntern.dart';
import 'package:provider/provider.dart';

class AddIntern extends StatelessWidget {
  const AddIntern({super.key});

  @override
  Widget build(BuildContext context) {
    final providerintern = Provider.of<ProviderIntern>(context);
    return Scaffold(
      appBar: AppBar(title: const Text(' Add intern')),
      body: ListView(children: [
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
              onChanged: providerintern.validateAddress,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'address',
                  errorText: providerintern.addressErrorText.isNotEmpty
                      ? providerintern.addressErrorText
                      : null),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: providerintern.mobilecontroler,
              onChanged: providerintern.validateMobileNumber,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'mobile number',
                  errorText: providerintern.mobileErrorText.isNotEmpty
                      ? providerintern.mobileErrorText
                      : null),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: providerintern.dobcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.calendar_today),
                labelText: 'date od birth (YYYY-MM-DD)',
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime(DateTime.now().year - 10),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(DateTime.now().year - 10),
                );
                providerintern.dobcontroller.text =
                    DateFormat('yyyy-MM-dd').format(pickedDate!);
              },
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: providerintern.addharcontroller,
              onChanged: providerintern.validateAddharNumber,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'addhar number',
                  errorText: providerintern.addharErrorText.isNotEmpty
                      ? providerintern.addharErrorText
                      : null),
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
          child:
              // TextField(
              //   controller: providerintern.yearcontroller,
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: ' year of study ',
              //   ),
              // )
              DropdownMenu<ColorLabel>(
            initialSelection: ColorLabel.green,
            controller: providerintern.feecontroller,
            requestFocusOnTap: true,
            label: const Text('Color'),
            onSelected: (ColorLabel? color) {
              providerintern.selectedColor = color;
            },
            dropdownMenuEntries: ColorLabel.values
                .map<DropdownMenuEntry<ColorLabel>>((ColorLabel color) {
              return DropdownMenuEntry<ColorLabel>(
                value: color,
                label: color.label,
                enabled: color.label != 'Grey',
                style: MenuItemButton.styleFrom(
                  foregroundColor: color.color,
                ),
              );
            }).toList(),
          ),
        ),
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
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          providerintern.insertData();
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
