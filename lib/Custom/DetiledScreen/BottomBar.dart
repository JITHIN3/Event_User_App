import 'package:event_user_app/Custom/DetiledScreen/Datetextfield.dart';
import 'package:event_user_app/Custom/DetiledScreen/bookingButton.dart';
import 'package:event_user_app/Custom/DetiledScreen/bookingtextfield.dart';
import 'package:event_user_app/Pages/Booking.dart';
import 'package:event_user_app/Utilities/deviceSize.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({super.key});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      surfaceTintColor: Colors.transparent,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: EdgeInsets.only(),
          height: 50,
          width: Helper.getScreenWidth(context) * .43,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepOrange),
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.chat,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Chat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              )),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BookingPage()));
          },
          child: Container(
            margin: EdgeInsets.only(left: 8),
            height: 50,
            width: Helper.getScreenWidth(context) * .43,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrange),
            child: Center(
                child: Text(
                  "Book Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                )),
          ),
        ),
      ]),
    );
  }

  /////_______///////

  displayform(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
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
              child: ListView(physics: ScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("User Details",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w400)),
                        GestureDetector(onTap: () {
                          Navigator.pop(context);
                        },
                          child: Text("Cancel",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepOrange)),
                        ),
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
                          label: "District",
                        ),
                        DateField(label: "Date"),

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
        });
  }
}
