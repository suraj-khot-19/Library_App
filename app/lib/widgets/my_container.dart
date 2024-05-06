import 'package:flutter/material.dart';

Widget containerWithBorder(String title) {
  return Expanded(
    child: IntrinsicHeight(
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        decoration: BoxDecoration(border: Border.all()),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget containerForRow(String title) {
  return IntrinsicHeight(
    child: Container(
      constraints: const BoxConstraints(minHeight: 50),
      decoration: BoxDecoration(border: Border.all()),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ),
  );
}
