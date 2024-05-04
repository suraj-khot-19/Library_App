import 'package:app/utils/controllers.dart';
import 'package:app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class MyTable extends StatefulWidget {
  const MyTable({Key? key});

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 0,
      fit: FlexFit.loose,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text('Particulars'),
            numeric: false,
          ),
          DataColumn(label: Text('Amount(₹)'), numeric: true),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Registration Fee*')),
              DataCell(
                textField(regFee, "", TextInputType.number, true),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Book Deposit')),
              DataCell(
                SizedBox(
                  width: double.infinity,
                  child:
                      textField(bookDeposit, "", TextInputType.number, false),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Locker Deposit')),
              DataCell(
                textField(lockerDeposit, "", TextInputType.number, false),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Library Fee*')),
              DataCell(
                textField(libFee, "", TextInputType.number, true),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Locker Fee')),
              DataCell(
                textField(lockerFee, "", TextInputType.number, false),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Total Payment Received*')),
              DataCell(
                textField(totalPayment, "", TextInputType.number, false),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
