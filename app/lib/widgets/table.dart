import 'package:app/utils/controllers.dart';
import 'package:app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class MyTable extends StatefulWidget {
  final TotalPayCallback? onTotalPayChanged;
  const MyTable({Key? key, this.onTotalPayChanged}) : super(key: key);

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  double getTotalPay() {
    return totalPay;
  }

  double totalPay = 0.0;

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
              const DataCell(Text('Total Payment Received')),
              DataCell(Align(
                alignment: Alignment.center,
                child: Text(
                  totalPay.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Add listeners to your controllers
    regFee.addListener(_updateTotalPay);
    bookDeposit.addListener(_updateTotalPay);
    lockerDeposit.addListener(_updateTotalPay);
    libFee.addListener(_updateTotalPay);
    lockerFee.addListener(_updateTotalPay);
  }

  @override
  void dispose() {
    // Clean up controllers
    regFee.dispose();
    bookDeposit.dispose();
    lockerDeposit.dispose();
    libFee.dispose();
    lockerFee.dispose();
    super.dispose();
  }

  void _updateTotalPay() {
    setState(() {
      double regFeeValue = double.tryParse(regFee.text.trim()) ?? 0.0;
      double bookDepositValue = double.tryParse(bookDeposit.text.trim()) ?? 0.0;
      double lockerDepositValue =
          double.tryParse(lockerDeposit.text.trim()) ?? 0.0;
      double libFeeValue = double.tryParse(libFee.text.trim()) ?? 0.0;
      double lockerFeeValue = double.tryParse(lockerFee.text.trim()) ?? 0.0;

      totalPay = regFeeValue +
          bookDepositValue +
          lockerDepositValue +
          libFeeValue +
          lockerFeeValue;
      widget.onTotalPayChanged?.call(totalPay);
    });
  }
}

typedef TotalPayCallback = void Function(double totalPay);
