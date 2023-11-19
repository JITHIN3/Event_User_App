import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_user_app/Custom/HomeWidget/BottomNavBar.dart';
import 'package:event_user_app/Custom/HomeWidget/EventCard.dart';
import 'package:event_user_app/Custom/HomeWidget/Header.dart';
import 'package:event_user_app/Custom/HomeWidget/PopularCard.dart';
import 'package:event_user_app/Pages/SignUp.dart';
import 'package:event_user_app/Service/Auth_Service.dart';

import 'package:event_user_app/Utilities/deviceSize.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthClass authClass = AuthClass();
  final _eventStream =
      FirebaseFirestore.instance.collection('events').snapshots();
  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stream = FirebaseFirestore.instance.collection('events').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          "Big Day Need Big Planning",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: _eventStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Connection Error");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(),);
              }
              var docs = snapshot.data!.docs;
              return Column(
                children: [
                  ListView(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      HomeHeader(),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Make Your Event",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            width: Helper.getScreenWidth(context),
                            height: 170,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: docs.length,
                                itemBuilder: (context, index) {
                                  return EventCards(
                                      image: "${docs[index]['image']}",
                                      title: '${docs[index]['eventname']} ');
                                }),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Popular Events",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PopularCard(),
                      PopularCard(),
                      PopularCard(),
                      PopularCard(),
                    ],
                  ),
                ],
              );
            }),
      ),
      drawer: Nav(),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  /////////// -----  WIDGETS ------ //////////

  Widget Nav() {
    return NavigationDrawer(children: [
      SizedBox(
        height: 10,
      ),
      Center(
          child: CircleAvatar(
        radius: 50.0,
        backgroundImage: NetworkImage(
            'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),
        backgroundColor: Colors.transparent,
      )),
      SizedBox(
        height: 5,
      ),
      Center(
          child: Text(
        "Arun MS",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      )),
      ListTile(
        title: Text("Logout"),
        trailing: IconButton(
            onPressed: () {
              _displayDialog(context);
            },
            icon: Icon(
              Icons.logout,
              color: Colors.red,
            )),
      )
    ]);
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            buttonPadding: EdgeInsets.all(50),
            content: Text("Are You Sure Exit?"),
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
                        builder: (builder) => SignUpPage(),
                      ),
                      (route) => false);
                },
              )
            ],
          );
        });
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   AuthClass authClass = AuthClass();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//         leading: IconButton(
//           onPressed: () async {
//             await authClass.signOut(context);
//             Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(
//                   builder: (builder) => SignUpPage(),
//                 ),
//                 (route) => false);
//           },
//           icon: Icon(
//             Icons.logout_outlined,
//             size: 35,
//             color: Colors.red,
//           ),
//         ),
//       ),
//     );
//   }
// }
