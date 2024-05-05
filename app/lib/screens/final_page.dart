import 'package:app/widgets/general_info.dart';
import 'package:app/widgets/receipt_table.dart';
import 'package:flutter/material.dart';
import '../utils/pdf_api.dart';
import '../widgets/sized_box.dart';

class FinalPage extends StatefulWidget {
  final String date,
      reciptNo,
      seatNo,
      planTime,
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
      required this.planTime,
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
  @override
  Widget build(BuildContext context) {
    final double totalPaymentValue = double.parse(widget.totalPayment);

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
              const Info(),
              ReceiptTable(
                  totalPayment: totalPaymentValue), // Pass totalPayment here
              ElevatedButton(
                  onPressed: () async {
                    final pdfFile =
                        await PdfApi.generatePdf(widget.totalPayment);
                    PdfApi.openFile(pdfFile);
                  },
                  child: const Text("Print Recipt"))
            ],
          ),
        ),
      ),
    );
  }
}
