import 'package:event_user_app/AdminPanel/AddEventScreen.dart';
import 'package:event_user_app/AdminPanel/AddPopularEventScreen.dart';
import 'package:event_user_app/AdminPanel/AddServices.dart';
import 'package:event_user_app/AdminPanel/ManageEventScreen.dart';
import 'package:event_user_app/AdminPanel/ViewBookingScreen.dart';
import 'package:event_user_app/Pages/SignIn.dart';
import 'package:event_user_app/Service/Auth_Service.dart';
import 'package:event_user_app/Utilities/deviceSize.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: Helper.getScreenHeight(context),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.purpleAccent, Colors.deepPurple.shade900],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text("Welcome! ",
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(.7))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: IconButton(
                                onPressed: () {
                                  _displayDialog(context);
                                },
                                icon: Icon(
                                  Icons.logout,
                                  color: Colors.black,
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Admin ",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(.7))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("Create Your Events and Services",
                            style: TextStyle(
                                color: Colors.white.withOpacity(.5),
                                fontWeight: FontWeight.w400)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Container(
                          height: Helper.getScreenHeight(context),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40)),
                              color: Colors.white),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 5),
                                          child: InkWell(
                                            child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Icon(
                                                  Icons.add,
                                                  size: 40,
                                                )),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddEventScreen(),
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
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 5),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewBooking(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
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
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 5),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ManageEvents(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
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
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 5),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddServiceScreen()
                                                ),
                                              );
                                            },
                                            child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(10)),
                                                child: Icon(
                                                  Icons.miscellaneous_services,
                                                  size: 40,
                                                )),
                                          ),
                                        ),
                                        Text("Add Service"),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 5),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PopularEventScreen()
                                                ),
                                              );
                                            },
                                            child: Container(
                                                height: 100,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                child: Icon(
                                                  Icons.graphic_eq,
                                                  size: 40,
                                                )),
                                          ),
                                        ),
                                        Text("Popular Events"),
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    ));
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            buttonPadding: EdgeInsets.all(50),
            content: Text("Are You Sure Logout?"),
            actions: <Widget>[
              InkWell(
                  child: Text(
                    "No",
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              InkWell(
                child: Text(
                  "Yes",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  await authClass.signOut(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => SignInPage(),
                      ),
                      (route) => false);
                },
              )
            ],
          );
        });
  }
}
