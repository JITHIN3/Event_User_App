import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_user_app/Pages/Booking.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

TextEditingController serviceController = TextEditingController();
TextEditingController detailsController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
void _validate(context){
  if(_formKey.currentState!.validate()){
    FirebaseFirestore.instance.collection("services").add({
      'service':serviceController.text,
      'details': detailsController.text,

    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Successfully Added"),
        backgroundColor: Colors.teal,
      ),
    );
    Navigator.pop(context);
    serviceController.clear();
    detailsController.clear();


  }
}
final CollectionReference _events =
FirebaseFirestore.instance.collection('services');

class _AddServiceScreenState extends State<AddServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Add Services...",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Service';
                      }
                      return null;
                    },
                      controller: serviceController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "Service"),
                    ),
                    SizedBox(
                      height: 10,
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
                          return 'Enter Details';
                        }
                        return null;
                      },
                        controller: detailsController,
                        maxLines: null,
                        style: TextStyle(color: Colors.black, fontSize: 17),
                        decoration: InputDecoration(
                          hintText: "Details",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                        ),
                      ),
                    ),
                    ElevatedButton(

                      onPressed: () {

                                  _validate(context);


                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
