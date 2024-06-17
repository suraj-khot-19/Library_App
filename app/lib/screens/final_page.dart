import 'package:app/widgets/general_info.dart';
import 'package:app/widgets/receipt_table.dart';
import 'package:flutter/material.dart';
import '../utils/pdf_api.dart';
import '../widgets/sized_box.dart';

class FinalPage extends StatefulWidget {
  final String date,
      reciptNo,
      seatNo,
      name,
      address,
      mob,
      refCode,
      regFee,
      bookDeposit,
      lockerDeposit,
      lockerFee,
      libFee,
      totalPayment;
  const FinalPage(
      {required this.date,
      required this.reciptNo,
      required this.seatNo,
      required this.name,
      required this.address,
      required this.mob,
      required this.refCode,
      required this.regFee,
      required this.bookDeposit,
      required this.lockerDeposit,
      required this.lockerFee,
      required this.libFee,
      required this.totalPayment,
      super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final double totalPaymentValue = double.parse(widget.totalPayment);

    return Scaffold(
      appBar: AppBar(
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
        title: Row(
          children: [
            Image.asset(
              'assets/app.png',
              fit: BoxFit.contain,
              height: 40,
            ),
            addHorizontalSpace(30),
            const Text("S-Library"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Info(),
              ReceiptTable(totalPayment: totalPaymentValue),
              addVerticalSpace(40), // Pass totalPayment
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  final pdfFile = await PdfApi.generatePdf(widget.totalPayment);
                  PdfApi.openFile(pdfFile);
                  setState(() {
                    isLoading = false;
                  });
                },
                child: Center(
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Create Receipt",
                              style: TextStyle(color: Colors.black),
                            ),
                    ),
                  ),
                ),
              ),
              addVerticalSpace(40), // Pass totalPayment
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Go Back",
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
    );
  }
}
