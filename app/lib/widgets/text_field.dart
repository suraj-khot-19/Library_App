import 'package:flutter/material.dart';

Widget textField(
    TextEditingController controller, String label, TextInputType inputType) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
    ),
    keyboardType: inputType,
  );
}
