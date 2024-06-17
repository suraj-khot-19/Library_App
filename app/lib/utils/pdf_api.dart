import 'dart:io';
import 'dart:math';
import 'package:app/utils/controllers.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfApi {
  static Future<File> generatePdf(String totalPayment) async {
    final pdf = pw.Document();
    // Generate a random number for the filename
    final random = Random();
    final randomNumber = random.nextInt(10000);
    final filename = 'S-Library$randomNumber.pdf';

    final logo = (await rootBundle.load("assets/app.png")).buffer.asUint8List();

    final customFont =
        pw.Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

    //headers for Table
    final headers = ["Particulars", "Amount (RS)"];
    //rows for table
    final rows = [
      RowValues(particulars: "Registration Fee", amount: regFee.text),
      RowValues(particulars: "Book Deposit", amount: bookDeposit.text),
      RowValues(particulars: "Locker Deposit", amount: lockerDeposit.text),
      RowValues(particulars: "Library Fee", amount: libFee.text),
      RowValues(particulars: "Locker Fee", amount: lockerFee.text),
      RowValues(particulars: "Total Payment Received", amount: totalPayment),
    ];
    final data = rows.map((e) => [e.particulars, e.amount]).toList();
    //context in pdf

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Container(
            padding: const pw.EdgeInsets.all(16),
            decoration: pw.BoxDecoration(
              color: PdfColors.white,
              border: pw.Border.all(width: 1, color: PdfColors.black),
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
                      width: 180, height: 180, fit: pw.BoxFit.cover),
                ),
                pw.SizedBox(height: 5),
                pw.Divider(),
                pw.SizedBox(height: 5),
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
                    pw.SizedBox(height: 5),
                    pw.Divider(),
                    pw.SizedBox(height: 5),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(12),
                      child: pw.Center(
                        child: pw.TableHelper.fromTextArray(
                          headerCellDecoration:
                              const pw.BoxDecoration(color: PdfColors.grey200),
                          headerStyle: pw.TextStyle(
                            font: customFont,
                          ),
                          headerAlignment: pw.Alignment.topLeft,
                          cellStyle: pw.TextStyle(
                            font: customFont,
                          ),
                          cellAlignment: pw.Alignment.topLeft, // Align cell
                          border: null,
                          headers: headers,
                          data: data,
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Divider(),
                    pw.SizedBox(height: 15),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Column(
                          children: [
                            pw.Container(
                                height: 40,
                                width: 90,
                                decoration:
                                    pw.BoxDecoration(border: pw.Border.all())),
                            addVerticalSpace(12),
                            myTextStyle("Authorized Signitory", customFont),
                          ],
                        ),
                        pw.Column(
                          children: [
                            pw.Container(
                                height: 40,
                                width: 90,
                                decoration:
                                    pw.BoxDecoration(border: pw.Border.all())),
                            addVerticalSpace(12),
                            myTextStyle("valid till", customFont),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    return saveDocument(name: filename, pdf: pdf);
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
    await OpenFile.open(url);
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
