import 'package:flutter/material.dart';
class BookingField extends StatelessWidget {
   BookingField({super.key,this.label,this.hint,this.controller});

   TextEditingController? controller;
  String? label;
  String? hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(controller: controller,
        style: TextStyle(color: Colors.black, fontSize: 17),
        decoration: InputDecoration(

          labelText: label,
          helperText: hint,
          labelStyle:
          TextStyle(color: Colors.black, fontSize: 17),


        ),
      ),
    );
  }
}
