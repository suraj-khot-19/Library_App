import 'package:app/screens/final_page.dart';
import 'package:app/widgets/drop_down.dart';
import 'package:app/widgets/sized_box.dart';
import 'package:app/widgets/table.dart';
import 'package:app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import '../utils/controllers.dart';
import '../widgets/date_picker.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  double totalPay = 0.0;

  double getTotalPay() {
    return totalPay;
  }

  final _formKey = GlobalKey<FormState>();

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
            padding: const EdgeInsets.all(16),
            child: Form(
              //form key
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  addVerticalSpace(25),
                  Row(
                    children: [
                      const PickDate(),
                      addHorizontalSpace(20),
                      Expanded(
                          child: textField(reciptNo, "Recipt No*",
                              TextInputType.text, true)),
                    ],
                  ),
                  addVerticalSpace(10),
                  Row(
                    children: [
                      Expanded(
                          child: textField(
                              seatNo, "Seat No*", TextInputType.text, true)),
                      addHorizontalSpace(20),
                      const Expanded(
                          // child: textField(
                          //     planTime, "Plan & Time", TextInputType.text)),
                          child: DropMenue()),
                    ],
                  ),
                  addVerticalSpace(10),
                  textField(name, "Name*", TextInputType.text, true),
                  addVerticalSpace(10),
                  textField(address, "Address", TextInputType.text, false),
                  addVerticalSpace(10),
                  mobileTextField(
                      mobile, "Mob No*", TextInputType.number, true, 10),
                  addVerticalSpace(0.1),
                  textField(
                      refCode, "Reference Code", TextInputType.text, false),
                  addVerticalSpace(10),
                  MyTable(
                    onTotalPayChanged: (totalPay) {
                      setState(() {
                        this.totalPay = totalPay;
                      });
                    },
                  ),
                  addVerticalSpace(10),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          // if (_formKey.currentState!.validate())
                          {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FinalPage(
                                      name: name.text,
                                      date: date.text,
                                      address: address.text,
                                      mob: mobile.text,
                                      planTime: planTime.text,
                                      reciptNo: reciptNo.text,
                                      refCode: refCode.text,
                                      seatNo: seatNo.text,
                                      regFee: regFee.text,
                                      bookDeposit: bookDeposit.text,
                                      lockerDeposit: lockerDeposit.text,
                                      lockerFee: lockerFee.text,
                                      libFee: libFee.text,
                                      totalPayment: totalPay.toString(),
                                    )));
                          }
                        },
                        child: const Text("Create Receipt")),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
