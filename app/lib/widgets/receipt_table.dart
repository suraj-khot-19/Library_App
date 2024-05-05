import 'package:app/utils/controllers.dart';
import 'package:app/utils/receipt_text_style.dart';
import 'package:flutter/material.dart';

class ReceiptTable extends StatelessWidget {
  const ReceiptTable({super.key});

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
              label: recriptText("Particulars"),
            ),
            DataColumn(
              label: recriptText('Amount(₹)'),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(recriptText('Registration Fee')),
                DataCell(
                  recriptText(regFee.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(recriptText('Book Deposit')),
                DataCell(
                  recriptText(bookDeposit.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(recriptText('Locker Deposit')),
                DataCell(
                  recriptText(lockerDeposit.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(recriptText('Library Fee')),
                DataCell(
                  recriptText(libFee.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(recriptText('Locker Fee')),
                DataCell(
                  recriptText(lockerFee.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(recriptText('Total Payment Received')),
                DataCell(
                  recriptText("20"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
