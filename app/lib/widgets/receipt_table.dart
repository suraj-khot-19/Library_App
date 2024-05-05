import 'package:app/utils/controllers.dart';
import 'package:app/utils/receipt_text_style.dart';
import 'package:flutter/material.dart';

class ReceiptTable extends StatefulWidget {
  final double totalPayment;
  ReceiptTable({super.key, required this.totalPayment});

  @override
  State<ReceiptTable> createState() => _ReceiptTableState();
}

class _ReceiptTableState extends State<ReceiptTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        width: double.infinity,
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(
              label: receiptText("Particulars"),
            ),
            DataColumn(
              label: receiptText('Amount(₹)'),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(receiptText('Registration Fee')),
                DataCell(
                  receiptText(regFee.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(receiptText('Book Deposit')),
                DataCell(
                  receiptText(bookDeposit.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(receiptText('Locker Deposit')),
                DataCell(
                  receiptText(lockerDeposit.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(receiptText('Library Fee')),
                DataCell(
                  receiptText(libFee.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(receiptText('Locker Fee')),
                DataCell(
                  receiptText(lockerFee.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(receiptText('Total Payment Received')),
                DataCell(
                  // receiptText(totalPayment.text),
                  receiptText(widget.totalPayment.toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
