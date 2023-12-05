import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_user_app/Pages/Booking.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

TextEditingController eventController = TextEditingController();
TextEditingController serviceController = TextEditingController();
final CollectionReference _events =
FirebaseFirestore.instance.collection('events');
List<String> dataArray = [];
String imageUrl = '';
class _AddEventScreenState extends State<AddEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Add Event...",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    controller: eventController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Event Name"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: serviceController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Services"),
                  ),
                  SizedBox(height: 10,),
                  InkWell(onTap: ()async {
                    final file = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (file == null) return;
                    String fileName =
                    DateTime.now().microsecondsSinceEpoch.toString();
                    Reference referenceRoot =
                    FirebaseStorage.instance.ref();
                    Reference referenceDireImages =
                    referenceRoot.child('images');
                    Reference referenceImageToUpload =
                    referenceDireImages.child(fileName);
                    try {
                      await referenceImageToUpload.putFile(File(file.path));
                      imageUrl =
                      await referenceImageToUpload.getDownloadURL();
                    } catch (error) {}
                  },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.camera_enhance_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                  Text("Choose Image"),
                  SizedBox(height: 30,),
                  ElevatedButton(

                    onPressed: () async {


                      if (imageUrl.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Choose Image"),

                          ),

                        );return;

                      }


                      final String eventname = eventController.text;
                      final String service = serviceController.text;
                      if (service != null) {
                        await _events.add({
                          "eventname": eventname,
                          "services": service,
                          "image": imageUrl,

                        });
                        eventController.clear();
                        serviceController.clear();

                      }

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
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     final file = await ImagePicker()
                  //         .pickImage(source: ImageSource.gallery);
                  //     if (file == null) return;
                  //     String fileName =
                  //     DateTime.now().microsecondsSinceEpoch.toString();
                  //     Reference referenceRoot =
                  //     FirebaseStorage.instance.ref();
                  //     Reference referenceDireImages =
                  //     referenceRoot.child('images');
                  //     Reference referenceImageToUpload =
                  //     referenceDireImages.child(fileName);
                  //     try {
                  //       await referenceImageToUpload
                  //           .putFile(File(file.path));
                  //       imageUrl =
                  //       await referenceImageToUpload.getDownloadURL();
                  //     } catch (error) {}
                  //   },
                  //   child: Text("Upload"),
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.green,
                  //     // Background color
                  //     // Text color
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //     padding: EdgeInsets.symmetric(
                  //         horizontal: 20.0, vertical: 12.0),
                  //     textStyle: TextStyle(fontSize: 18.0),
                  //     elevation: 5.0,
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
