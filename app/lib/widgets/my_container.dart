import 'package:flutter/material.dart';

Widget containerWithBorder(String title) {
  return Expanded(
    child: Container(
      height: 50,
      decoration: BoxDecoration(border: Border.all()),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
      ),
    ),
  );
}
