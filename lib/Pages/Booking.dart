import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_user_app/Custom/DetiledScreen/BottomBar.dart';
import 'package:event_user_app/Custom/DetiledScreen/Datetextfield.dart';
import 'package:event_user_app/Custom/DetiledScreen/bookingButton.dart';
import 'package:event_user_app/Custom/DetiledScreen/bookingtextfield.dart';
import 'package:event_user_app/Utilities/deviceSize.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController eventController = TextEditingController();
TextEditingController districtController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController _date = TextEditingController();
TextEditingController addressController = TextEditingController();

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("User Details",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w400)),
                      GestureDetector(
                        onTap: () {
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
                BookingField(
                  controller: nameController,
                  label: "Name",
                ),
                BookingField(
                  controller: phoneController,
                  label: "Phone",
                ),
                BookingField(
                  controller: emailController,
                  label: "Email",
                ),
                BookingField(
                  controller: eventController,
                  label: "Your Event",
                ),

                BookingField(
                  controller: districtController,
                  label: "District",
                ),

                BookingField(hint: "dd/mm/yyyy",controller: dateController,label: "Date"),
                Container(margin: EdgeInsets.only(left: 5,right: 5,top: 10),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(  border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: addressController,
                    maxLines: null,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    decoration: InputDecoration(
                      hintText: "Address",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                    ),
                  ),
                ),


                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BookingButton(
                  title: "Pay Now",
                  width: Helper.getScreenWidth(context) * .43,
                  ontap: () {},
                  color: Colors.blue),
              // BookingButton(
              //     title: "Submit",
              //     width: Helper.getScreenWidth(context) * .43,
              //     ontap: () {
              //       FirebaseFirestore.instance.collection("bookings").add({
              //         'Name': nameController.text,
              //         'Phone': phoneController.text,
              //         'Email': emailController.text,
              //         'Event': eventController.text,
              //         'District': districtController.text,
              //         'Date': dateController.text
              //       });
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(
              //           content: Text("Successfully Created"),
              //           backgroundColor: Colors.teal,
              //         ),
              //       );
              //       Navigator.pop(context);
              //       nameController.clear();
              //       phoneController.clear();
              //       emailController.clear();
              //       eventController.clear();
              //       districtController.clear();
              //       dateController.clear();
              //     },
              //     color: Colors.deepOrange),
              ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance.collection("bookings").add({
                    'Name': nameController.text,
                    'Phone': phoneController.text,
                    'Email': emailController.text,
                    'Event': eventController.text,
                    'District': districtController.text,
                    'Date': dateController.text,
                    'Address' : addressController.text,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Successfully SubmiitedS"),
                      backgroundColor: Colors.teal,
                    ),
                  );
                  Navigator.pop(context);
                  nameController.clear();
                  phoneController.clear();
                  emailController.clear();
                  eventController.clear();
                  districtController.clear();
                  dateController.clear();
                  addressController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  // Background color
                  // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 12.0),
                  textStyle: TextStyle(fontSize: 18.0),
                  elevation: 5.0,
                ),
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
