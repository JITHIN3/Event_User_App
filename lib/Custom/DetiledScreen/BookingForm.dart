import 'package:event_user_app/Custom/DetiledScreen/Datetextfield.dart';
import 'package:event_user_app/Custom/DetiledScreen/bookingButton.dart';
import 'package:event_user_app/Custom/DetiledScreen/bookingtextfield.dart';
import 'package:event_user_app/Utilities/deviceSize.dart';
import 'package:flutter/material.dart';
class BookingForm extends StatelessWidget {
  const BookingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 40, left: 30, right: 30, bottom: 100),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: 30,
        height: 20,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("User Details",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w400)),
                  Text("Cancel",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500,color: Colors.deepOrange)),
                ],
              ),
            ),
            Material(
              child: Column(
                children: [
                  BookingField(
                    label: "Name",
                  ),
                  BookingField(
                    label: "Phone",
                  ),
                  BookingField(
                    label: "Your Event",
                  ),
                  BookingField(
                    label: "Pace",
                  ),


                  SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BookingButton(
                          title: "Pay Now",
                          width: Helper.getScreenWidth(context) * .3,
                          ontap: () {},
                          color: Colors.blue),
                      BookingButton(
                          title: "Submit",
                          width: Helper.getScreenWidth(context) * .3,
                          ontap: () {},
                          color: Colors.deepOrange),
                    ],
                  )
                ],
              )
              ,)
          ],
        ),
      ),
    );
  }
}
