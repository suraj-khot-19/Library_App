import 'package:app/utils/receipt_text_style.dart';
import 'package:app/widgets/my_container.dart';
import 'package:app/widgets/sized_box.dart';
import 'package:flutter/material.dart';
import '../utils/controllers.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  receiptText("Date"),
                  addHorizontalSpace(5),
                  containerWithBorder(date.text),
                  addHorizontalSpace(5),
                  receiptText("Receipt No"),
                  addHorizontalSpace(5),
                  containerWithBorder(reciptNo.text),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  receiptText("Seat No"),
                  addHorizontalSpace(5),
                  containerWithBorder(seatNo.text),
                  addHorizontalSpace(5),
                  receiptText("Plan & Time"),
                  addHorizontalSpace(5),
                  containerWithBorder(
                    planTime.text,
                  ),
                ],
              ),
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              receiptText("Name"),
              addHorizontalSpace(5),
              containerWithBorder(
                name.text,
              ),
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              receiptText("Address"),
              addHorizontalSpace(5),
              containerWithBorder(address.text),
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              receiptText("Mob No"),
              addHorizontalSpace(5),
              containerWithBorder(mobile.text),
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              receiptText("Reference Code"),
              addHorizontalSpace(5),
              containerWithBorder(refCode.text),
            ],
          ),
          addVerticalSpace(10),
        ],
      ),
    );
  }
}
