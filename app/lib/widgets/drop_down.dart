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
    "11 Hr",
    "12 Hr",
    "13 Hr",
    "14 Hr",
    "15 Hr",
    "16 Hr",
    "17 Hr",
    "18 Hr",
    "19 Hr",
    "20 Hr",
    "21 Hr",
    "22 Hr",
    "23 Hr",
    "24 Hr",
    "25 Hr",
    "26 Hr",
    "27 Hr",
    "28 Hr",
    "29 Hr",
    "30 Hr",
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
