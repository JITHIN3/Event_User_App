import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_user_app/Custom/DetiledScreen/BottomBar.dart';
import 'package:event_user_app/Custom/DetiledScreen/Datetextfield.dart';
import 'package:event_user_app/Custom/DetiledScreen/bookingButton.dart';
import 'package:event_user_app/Custom/DetiledScreen/bookingtextfield.dart';
import 'package:event_user_app/Pages/Booking.dart';
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
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

void _validate(context){
  if(_formKey.currentState!.validate()){
    FirebaseFirestore.instance.collection("bookings").add({
      'Name': nameController.text,
      'Phone': phoneController.text,
      'Email': emailController.text,
      'Event': eventController.text,
      'District': districtController.text,
      'Date': dateController.text,
      'Address': addressController.text,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Successfully Booked"),
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

  }
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Enter Name';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Enter Phone';
                        }
                        if(value.length < 10 || value.length > 10){
                          return "Enter Valid PhoneNumber";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                        labelText: "Phone",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Enter Email';
                        }

                        return null;
                      },
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: eventController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Enter Event';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                        labelText: "Event",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: districtController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Enter District';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                        labelText: "District",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: dateController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Enter Date';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      decoration: InputDecoration(
                        labelText: "Date",
                        hintText: "dd/mm/yyyy",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Address';
                      }
                      return null;
                    },
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
              ElevatedButton(
                onPressed: () {


                      _validate(context);

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  // Background color
                  // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
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
