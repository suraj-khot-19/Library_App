import 'package:app/utils/controllers.dart';
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
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Particulars'),
            ),
            DataColumn(
              label: Text('Amount(₹)'),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('Registration Fee')),
                DataCell(
                  Text(regFee.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('Book Deposit')),
                DataCell(
                  Text(bookDeposit.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('Locker Deposit')),
                DataCell(
                  Text(lockerDeposit.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('Library Fee')),
                DataCell(
                  Text(libFee.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('Locker Fee')),
                DataCell(
                  Text(lockerFee.text),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('Total Payment Received')),
                DataCell(
                  Text(totalPayment.text),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
