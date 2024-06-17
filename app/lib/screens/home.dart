import 'package:app/screens/final_page.dart';
import 'package:app/widgets/sized_box.dart';
import 'package:app/widgets/table.dart';
import 'package:app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  //btn confirmation msg
  Future<void> onClickBtn() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            shadowColor: Colors.red,
            iconColor: Colors.black,
            backgroundColor: Colors.white,
            titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
            icon: const Icon(Icons.code_sharp),
            title: const Text(
              "About App",
            ),
            content: const Text(
              "This App Is Designed By Suraj Khot",
            ),
            contentTextStyle: TextStyle(color: Colors.black),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () async {
                  const url = 'https://www.linkedin.com/in/khot-suraj';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(url)),
                    );
                  }
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Visit Profile",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 230, 103, 192),
                    Color.fromARGB(129, 46, 197, 200)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  stops: [0.4, 0.1]),
            ),
          ),
          leading: InkWell(onTap: onClickBtn, child: Icon(Icons.menu)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/app.png',
                fit: BoxFit.contain,
                height: 40,
              ),
              addHorizontalSpace(30),
              const Text(
                "S-Library",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
                        child: textField(
                            reciptNo, "Recipt No*", TextInputType.text, true)),
                  ],
                ),
                addVerticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: textField(
                          seatNo, "Seat No*", TextInputType.text, true),
                    ),
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
                textField(refCode, "Reference Code", TextInputType.text, false),
                addVerticalSpace(10),
                MyTable(
                  onTotalPayChanged: (totalPay) {
                    setState(() {
                      this.totalPay = totalPay;
                    });
                  },
                ),
                addVerticalSpace(40),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FinalPage(
                            name: name.text,
                            date: date.text,
                            address: address.text,
                            mob: mobile.text,
                            reciptNo: reciptNo.text,
                            refCode: refCode.text,
                            seatNo: seatNo.text,
                            regFee: regFee.text,
                            bookDeposit: bookDeposit.text,
                            lockerDeposit: lockerDeposit.text,
                            lockerFee: lockerFee.text,
                            libFee: libFee.text,
                            totalPayment: totalPay.toString(),
                          ),
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          "Create Receipt",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                addVerticalSpace(60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
