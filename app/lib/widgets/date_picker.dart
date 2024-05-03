import 'package:app/utils/controllers.dart';
import 'package:flutter/material.dart';

class PickDate extends StatefulWidget {
  const PickDate({super.key});

  @override
  State<PickDate> createState() => _PickDateState();

  static void pickDate() {}
}

class _PickDateState extends State<PickDate> {
  Future<void> pickDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2104),
    );

    if (_picked != null) {
      setState(() {
        String formattedDate =
            "${_picked.day}-${_picked.month}-${_picked.year}";
        date.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: date,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Date *",
          prefixIcon: Icon(Icons.calendar_today),
        ),
        validator: (value) {
          if ((value == null || value.isEmpty)) {
            return 'Please enter Date';
          }
          return null;
        },
        onTap: () {
          pickDate();
        },
      ),
    );
  }
}
