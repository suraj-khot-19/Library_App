import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

//for rowValue
class RowValues {
  final String particulars;
  final String amount;
  const RowValues({required this.particulars, required this.amount});
}

class PdfApi {
  static Future<File> generatePdf() async {
    final pdf = pw.Document();
    final customFont =
        pw.Font.ttf(await rootBundle.load('assets/OpenSans-Regular.ttf'));

    //logo
    // final logo = (await rootBundle.load("assets/app.png")).buffer.asUint8List();
    //context in pdf

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        // build: (pw.Context context) {
        build: (context) {
          return pw.Center(
            child: pw.Text("Hello World",
                style: pw.TextStyle(font: customFont, fontSize: 40)),
          );
        },
      ),
    );
    return saveDocument(name: 'recipt_1.pdf', pdf: pdf);
  }

  static Future<File> saveDocument(
      {required String name, required pw.Document pdf}) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    print("Directory path: ${dir.path}");
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
}
