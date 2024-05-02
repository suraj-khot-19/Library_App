import 'package:app/widgets/sized_box.dart';
import 'package:app/widgets/table.dart';
import 'package:app/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../utils/controllers.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            children: [
              Image.asset(
                'assets/app.png',
                fit: BoxFit.contain,
                height: 40,
              ),
              addHorizontalSpace(30),
              const Text("ShikshaGram"),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                addVerticalSpace(25),
                Row(
                  children: [
                    Expanded(
                        child: textField(date, "Date", TextInputType.datetime)),
                    addHorizontalSpace(20),
                    Expanded(
                        child: textField(
                            reciptNo, "Recipt No.", TextInputType.text)),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                        child:
                            textField(seatNo, "Seat No", TextInputType.text)),
                    addHorizontalSpace(20),
                    Expanded(
                        child: textField(
                            planTime, "Plan & Time", TextInputType.text)),
                  ],
                ),
                addVerticalSpace(10),
                textField(name, "Name", TextInputType.text),
                addVerticalSpace(10),
                textField(address, "Address", TextInputType.text),
                addVerticalSpace(10),
                textField(mobile, "Mob No.", TextInputType.number),
                addVerticalSpace(10),
                textField(refCode, "Reference Code", TextInputType.text),
                addVerticalSpace(10),
                const MyTable(),
              ],
            ),
          ),
        ));
  }
}
