import 'package:app/utils/controllers.dart';
import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';

class DropMenue extends StatefulWidget {
  const DropMenue({super.key});

  @override
  State<DropMenue> createState() => _DropMenueState();
}

class _DropMenueState extends State<DropMenue> {
  String _selected = "";
  List<String> arr = [
    "1 Hr",
    "2 Hr",
    "3 Hr",
    "4 Hr",
    "5 Hr",
    "6 Hr",
    "7 Hr",
    "8 Hr",
    "9 Hr",
    "10 Hr",
  ];
  @override
  Widget build(BuildContext context) {
    return DropDownField(
      controller: planTime,
      onValueChanged: (value) {
        _selected = value;
      },
      value: _selected,
      enabled: true,
      required: false,
      hintText: "Plan & Time",
      labelText: "Plan & Time",
      labelStyle: const TextStyle(background: null, color: Colors.black),
      items: arr,
      hintStyle: const TextStyle(color: Colors.black),
      itemsVisibleInDropdown: 2,
    );
  }
}
