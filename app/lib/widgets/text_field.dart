import 'package:flutter/material.dart';

Widget textField(TextEditingController controller, String label,
    TextInputType inputType, bool isRequired) {
  return SizedBox(
    width: double.infinity,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        focusColor: Colors.blue,
      ),
      keyboardType: inputType,
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return 'Please enter $label';
        }
        return null;
      },
    ),
  );
}

Widget mobileTextField(TextEditingController controller, String label,
    TextInputType inputType, bool isRequired, int length) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ),
    maxLength: length,
    keyboardType: inputType,
    validator: (value) {
      if (isRequired && (value == null || value.isEmpty)) {
        return 'Please enter $label';
      }
      return null;
    },
  );
}
