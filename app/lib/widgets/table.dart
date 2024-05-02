import 'package:app/utils/controllers.dart';
import 'package:app/widgets/sized_box.dart';
import 'package:app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.black, // Border color
      //     width: 1.0, // Border width
      //   ),
      // ),
      width: double.infinity,
      child: DataTable(
        columnSpacing: 3,
        // border: TableBorder.all(width: 1),
        checkboxHorizontalMargin: 1,
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
                Row(
                  children: [
                    Expanded(
                        child: textField(regFee, "", TextInputType.number)),
                    addHorizontalSpace(2),
                    const Text("Book-Fee"),
                    addHorizontalSpace(2),
                    Expanded(
                        child: textField(bookFee, "", TextInputType.number)),
                  ],
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Book Deposit')),
              DataCell(
                Row(
                  children: [
                    Expanded(
                        child:
                            textField(bookDeposit, "", TextInputType.number)),
                    addHorizontalSpace(2),
                    const Text("Other-Fee"),
                    addHorizontalSpace(2),
                    Expanded(
                        child: textField(otherFee, "R1", TextInputType.number)),
                  ],
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Locker Deposit')),
              DataCell(
                Row(
                  children: [
                    Expanded(
                        child:
                            textField(lockerDeposit, "", TextInputType.number)),
                    addHorizontalSpace(2),
                    const Text("Break-up of Payment (₹)"),
                  ],
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Library Fee')),
              DataCell(
                Row(
                  children: [
                    Expanded(
                        child: textField(libFee, "", TextInputType.number)),
                    addHorizontalSpace(2),
                    const Text("Cash"),
                    addHorizontalSpace(2),
                    //check TextInputType for cash
                    Expanded(
                        child: textField(otherFee, "", TextInputType.number)),
                  ],
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Locker Fee')),
              DataCell(
                Row(
                  children: [
                    Expanded(
                        child: textField(lockerFee, "", TextInputType.number)),
                    addHorizontalSpace(2),
                    const Text("online"),
                    addHorizontalSpace(2),
                    //check TextInputType for online
                    Expanded(
                        child: textField(otherFee, "", TextInputType.number)),
                  ],
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              const DataCell(Text('Total Payment Received')),
              DataCell(
                Row(
                  children: [
                    Expanded(
                        child:
                            textField(totalPayment, "", TextInputType.number)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
