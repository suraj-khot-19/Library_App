import 'dart:io';
import 'package:app/utils/controllers.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfApi {
  static Future<File> generatePdf() async {
    final pdf = pw.Document();

    //logo
    final logo = (await rootBundle.load("assets/app.png")).buffer.asUint8List();
    //font style
    final customFont =
        pw.Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

    //headers for Table
    final headers = ["Particulars", "Amount (Rs)"];
    //rows for table
    final rows = [
      RowValues(particulars: "Registration Fee", amount: regFee.text),
      RowValues(particulars: "Book Deposit", amount: bookDeposit.text),
      RowValues(particulars: "Locker Deposit", amount: lockerDeposit.text),
      RowValues(particulars: "Library Fee", amount: libFee.text),
      RowValues(particulars: "Locker Fee", amount: lockerFee.text),
      RowValues(
          particulars: "Total Payment Received", amount: totalPayment.text),
    ];
    final data = rows.map((e) => [e.particulars, e.amount]).toList();
    //context in pdf

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Container(
            padding: const pw.EdgeInsets.all(20),
            decoration: pw.BoxDecoration(
              color: PdfColors.white,
              border: pw.Border.all(width: 2, color: PdfColors.grey),
              borderRadius: pw.BorderRadius.circular(10),
              boxShadow: const [
                pw.BoxShadow(
                  color: PdfColors.grey,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Align(
                  alignment: pw.Alignment.topCenter,
                  child: pw.Image(pw.MemoryImage(logo),
                      width: 150, height: 150, fit: pw.BoxFit.cover),
                ),
                pw.Divider(),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  children: [
                    pw.Row(
                      children: [
                        pw.Expanded(
                          child: pw.Align(
                            alignment: pw.Alignment.topLeft,
                            child: pw.Row(
                              children: [
                                myTextStyle("Date :", customFont),
                                addHorizontalSpace(10),
                                myTextStyle(date.text, customFont),
                                addHorizontalSpace(20),
                              ],
                            ),
                          ),
                        ),
                        pw.Expanded(
                          child: pw.Align(
                            alignment: pw.Alignment.topRight,
                            child: pw.Row(
                              children: [
                                myTextStyle("Receipt No :", customFont),
                                addHorizontalSpace(10),
                                myTextStyle(reciptNo.text, customFont),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(10),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          child: pw.Row(
                            children: [
                              myTextStyle("Seat No:", customFont),
                              addHorizontalSpace(5),
                              myTextStyle(seatNo.text, customFont),
                            ],
                          ),
                        ),
                        addHorizontalSpace(20),
                        pw.Expanded(
                          child: pw.Row(
                            children: [
                              myTextStyle("Plan & Time:", customFont),
                              addHorizontalSpace(5),
                              myTextStyle(planTime.text, customFont),
                            ],
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(10),
                    pw.Row(
                      children: [
                        myTextStyle("Name :", customFont),
                        addHorizontalSpace(10),
                        myTextStyle(name.text, customFont),
                      ],
                    ),
                    addVerticalSpace(10),
                    pw.Row(
                      children: [
                        myTextStyle("Address :", customFont),
                        addHorizontalSpace(10),
                        myTextStyle(address.text, customFont),
                      ],
                    ),
                    addVerticalSpace(10),
                    pw.Row(
                      children: [
                        myTextStyle("Mobile No :", customFont),
                        addHorizontalSpace(10),
                        myTextStyle(mobile.text, customFont),
                      ],
                    ),
                    addVerticalSpace(10),
                    pw.Row(
                      children: [
                        myTextStyle("Reference Code :", customFont),
                        addHorizontalSpace(10),
                        myTextStyle(refCode.text, customFont),
                      ],
                    ),
                    pw.Divider(),
                    pw.TableHelper.fromTextArray(
                      headerStyle: pw.TextStyle(
                          font: customFont, fontWeight: pw.FontWeight.bold),
                      headerAlignment: pw.Alignment.topLeft,
                      cellStyle: pw.TextStyle(
                        font: customFont,
                        color: PdfColors.black,
                      ),
                      cellAlignment:
                          pw.Alignment.topLeft, // Align cell content to center
                      border: null,
                      headers: headers,
                      data: data,
                    ),
                    pw.Divider(),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Column(
                          children: [
                            myTextStyle("Authorized Signitory", customFont),
                            addVerticalSpace(10),
                            myTextStyle("Authorized Signitory", customFont),
                          ],
                        ),
                        pw.Column(
                          children: [
                            myTextStyle("valid till", customFont),
                            addVerticalSpace(10),
                            myTextStyle("valid till", customFont),
                          ],
                        ),
                      ],
                    ),
                    addVerticalSpace(10),
                    pw.Container(
                        width: double.infinity,
                        child: myTextStyle(
                            "Note Fees once paid, Junded or adjusted for any unutilized days whatsoever. Subscription must be rewed on or before the validity period. Fee will not be transferred to other student's names either",
                            customFont)),
                    addVerticalSpace(3),
                    pw.Container(
                        width: double.infinity,
                        child: myTextStyle(
                            '"Will be refunded (without interest) upon return of Rey and clearance of cupboard or submission of books(if any).',
                            customFont)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    return saveDocument(name: 'recipt_1.pdf', pdf: pdf);
  }

  static Future<File> saveDocument(
      {required String name, required pw.Document pdf}) async {
    final bytes = await pdf.save();
    final dir = await getDownloadsDirectory();
    final file = File('${dir!.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    print("Opening file: $url");
    try {
      await OpenFile.open(url);
      print("File opened successfully.");
    } catch (e) {
      print("Error opening file: $e");
    }
  }

  static pw.Text myTextStyle(String text, pw.Font fontStyle) {
    return pw.Text(text, style: pw.TextStyle(font: fontStyle));
  }

  static pw.SizedBox addVerticalSpace(double height) {
    return pw.SizedBox(height: height);
  }

  static pw.SizedBox addHorizontalSpace(double width) {
    return pw.SizedBox(width: width);
  }
}

//for rowValue
class RowValues {
  final String particulars;
  final String amount;
  const RowValues({required this.particulars, required this.amount});
}
