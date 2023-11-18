import 'package:event_user_app/AdminPanel/AddEventScreen.dart';
import 'package:event_user_app/AdminPanel/ManageEventScreen.dart';
import 'package:event_user_app/AdminPanel/ViewBookingScreen.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blueAccent, Colors.white, Colors.pinkAccent],
          )),
          child: Column(children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "ADMIN",
                style: TextStyle(fontSize: 25),
              ),
            )),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 5),
                      child: InkWell(
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              Icons.add,
                              size: 40,
                            )),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEventScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    Text("Add Event"),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewBooking(),
                            ),
                          );
                        },
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              Icons.book_outlined,
                              size: 40,
                            )),
                      ),
                    ),
                    Text("Bookings"),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ManageEvents(),
                            ),
                          );
                        },
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              Icons.edit_calendar,
                              size: 40,
                            )),
                      ),
                    ),
                    Text("Manage Events"),
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
