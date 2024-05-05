import 'package:flutter/material.dart';

Widget textField(TextEditingController controller, String label,
    TextInputType inputType, bool isRequired) {
  return Padding(
    padding: const EdgeInsets.only(top: 6, bottom: 6),
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
      maxLines: 1, // Added this line
    ),
  );
}

Widget mobileTextField(TextEditingController controller, String label,
    TextInputType inputType, bool isRequired, int length) {
  return Padding(
    padding: const EdgeInsets.only(top: 6),
    child: TextFormField(
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
    ),
  );
}
