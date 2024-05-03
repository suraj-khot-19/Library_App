import 'package:app/utils/controllers.dart';
import 'package:app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Border color
          width: 1.0, // Border width
        ),
      ),
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
                textField(regFee, "", TextInputType.number),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Book Deposit')),
              DataCell(
                textField(bookDeposit, "", TextInputType.number),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Locker Deposit')),
              DataCell(
                textField(lockerDeposit, "", TextInputType.number),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Library Fee')),
              DataCell(
                textField(libFee, "", TextInputType.number),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Locker Fee')),
              DataCell(
                textField(lockerFee, "", TextInputType.number),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Total Payment Received')),
              DataCell(
                textField(totalPayment, "", TextInputType.number),
              ),
            ],
          ),
        ],
      ),
    );
  }
}