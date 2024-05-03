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
                  const Text("Date"),
                  addHorizontalSpace(5),
                  containerWithBorder(
                    Text(date.text),
                  ),
                  addHorizontalSpace(5),
                  const Text("Receipt No"),
                  addHorizontalSpace(5),
                  containerWithBorder(
                    Text(reciptNo.text),
                  ),
                ],
              ),
              addVerticalSpace(10),
              Row(
                children: [
                  const Text("Seat No"),
                  addHorizontalSpace(5),
                  containerWithBorder(Text(seatNo.text)),
                  addHorizontalSpace(5),
                  const Text("Plan & Time"),
                  addHorizontalSpace(5),
                  containerWithBorder(
                    Text(planTime.text),
                  ),
                ],
              ),
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              const Text("Name"),
              addHorizontalSpace(5),
              containerWithBorder(
                Text(name.text),
              ),
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              const Text("Address"),
              addHorizontalSpace(5),
              containerWithBorder(
                Text(address.text),
              ),
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              const Text("Mob No"),
              addHorizontalSpace(5),
              containerWithBorder(
                Text(mobile.text),
              ),
            ],
          ),
          addVerticalSpace(10),
          Row(
            children: [
              const Text("Reference Code"),
              addHorizontalSpace(5),
              containerWithBorder(
                Text(refCode.text),
              ),
            ],
          ),
          addVerticalSpace(10),
        ],
      ),
    );
  }
}

// Row(
          //   children: [
          //     const Text("Date"),
          //     Text(date.text),
          //     addHorizontalSpace(5),
          //     const Text("Receipt No"),
          //     Text(reciptNo.text),
          //   ],
          // ),
          // addVerticalSpace(10),
          // Row(
          //   children: [
          //     const Text("Seat No"),
          //     Text(seatNo.text),
          //     addHorizontalSpace(5),
          //     const Text("Plan & Time"),
          //     Text(planTime.text),
          //   ],
          // ),