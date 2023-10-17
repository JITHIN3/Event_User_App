import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  DateField({super.key, this.hint, this.label});


  String? label;
  String? hint;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: _date,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),

          );
          if (pickedDate !=null){
            setState(() {
              _date.text = DateFormat("dd-MM-yyyy").format(pickedDate);
            });
          }
        },
        style: TextStyle(color: Colors.black, fontSize: 17),
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.calendar_month_outlined),
          labelText: widget.label,
          helperText: widget.hint,
          labelStyle: TextStyle(color: Colors.black, fontSize: 17),

        ),
      ),
    );
  }
}
