import 'package:app/utils/controllers.dart';
import 'package:app/widgets/sized_box.dart';
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  'Particulars',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 4,
                child: Text('Amount(₹)',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              )
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Row(
            children: [
              const Expanded(
                flex: 5,
                child: Text(
                  'Registration Fee*',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 6,
                child: textField(
                    regFee, "Registration Fee*", TextInputType.number, true),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Row(
            children: [
              const Expanded(
                flex: 5,
                child: Text(
                  'Book Deposit',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 6,
                child: textField(
                    bookDeposit, "Book Deposit", TextInputType.number, false),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Row(
            children: [
              const Expanded(
                flex: 5,
                child: Text(
                  'Locker Deposit',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 6,
                child: textField(lockerDeposit, "Locker Deposit",
                    TextInputType.number, false),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Row(
            children: [
              const Expanded(
                flex: 5,
                child: Text(
                  'Library Fee',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 6,
                child: textField(
                    libFee, "Library Fee*", TextInputType.number, true),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Row(
            children: [
              const Expanded(
                flex: 5,
                child: Text(
                  'Locker Fee',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 6,
                child: textField(
                    lockerFee, "Locker Fee", TextInputType.number, false),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          addVerticalSpace(5),
          Row(
            children: [
              const Expanded(
                flex: 6,
                child: Text(
                  'Total Payment\n Received',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 4,
                child: Text(
                  totalPay.toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
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
