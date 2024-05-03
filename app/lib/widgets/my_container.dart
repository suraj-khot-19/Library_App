import 'package:flutter/material.dart';

Widget containerWithBorder(Text text) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: text,
      ),
    ),
  );
}
