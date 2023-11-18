import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

TextEditingController eventController = TextEditingController();
TextEditingController serviceController = TextEditingController();
List<String> dataArray = [];

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
                  ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection("events").add({
                        'eventname': eventController.text,
                        'services': serviceController.text,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Successfully Created"),
                          backgroundColor: Colors.teal,
                        ),
                      );
                      Navigator.pop(context);
                      eventController.clear();
                      serviceController.clear();
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
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Upload"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
