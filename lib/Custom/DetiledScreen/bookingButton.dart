import 'package:flutter/material.dart';
class BookingButton extends StatefulWidget {
   BookingButton({super.key,this.width,required this.title,required this.ontap,this.color});
    final double?  width;
    final String title;
   final VoidCallback ontap;
   final Color? color;
  @override
  State<BookingButton> createState() => _BookingButtonState();
}

class _BookingButtonState extends State<BookingButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:(){},
      child: Container(
        margin: EdgeInsets.only(left: 8),
        height: 50,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:widget.color),
        child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            )),
      ),
    );
  }
}
