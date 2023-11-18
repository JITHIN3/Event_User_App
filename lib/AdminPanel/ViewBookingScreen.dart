import 'package:event_user_app/Utilities/deviceSize.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewBooking extends StatefulWidget {
  const ViewBooking({super.key, this.id});

  final String? id;

  @override
  State<ViewBooking> createState() => _ViewBookingState();
}

class _ViewBookingState extends State<ViewBooking> {
  final _bookingStream =
      FirebaseFirestore.instance.collection('bookings').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookings"),
      ),
      body: Container(height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueAccent, Colors.white, Colors.pinkAccent],
            )),
        child: StreamBuilder(
            stream: _bookingStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Connection Error");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var docs = snapshot.data!.docs;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                          width: Helper.getScreenWidth(context),
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                new BoxShadow(
                                  offset: Offset(3, 5),
                                  color: Colors.black,
                                  blurRadius: 10.0,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${docs[index]['Event']} ',
                                            style: TextStyle(fontSize: 22)),
                                        InkWell(
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.redAccent,
                                          ),

                                          onTap: () {
                                            _showAlertDialog(context,snapshot,index);
                                          },
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Name : ${docs[index]['Name']}",
                                        style: TextStyle(fontSize: 15)),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Phone No : ${docs[index]['Phone']} ",
                                        style: TextStyle(fontSize: 15)),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Email : ${docs[index]['Email']} ",
                                        style: TextStyle(fontSize: 15)),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Event Date: ${docs[index]['Date']} ",
                                        style: TextStyle(fontSize: 15)),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("District : ${docs[index]['District']} ",
                                        style: TextStyle(fontSize: 15)),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Address : ${docs[index]['Address']} ",
                                        style: TextStyle(fontSize: 15)),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }),
      ),

    );
  }

  void delete(id) {
    FirebaseFirestore.instance.collection('bookings').doc(id).delete();
  }
  void _showAlertDialog(BuildContext context,snapshot,index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete'),
          content: Text('Are You Sure Delete This Booking?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
              child: Text('No',style: TextStyle(color: Colors.blueAccent),),
            ),
            TextButton(
              onPressed: ()async {

                  delete(snapshot.data!.docs[index].id);
                  Navigator.pop(context);

                // Close the alert dialog
              },
              child: Text('Yes',style: TextStyle(color: Colors.redAccent)),
            ),
          ],
        );
      },
    );
  }
}
