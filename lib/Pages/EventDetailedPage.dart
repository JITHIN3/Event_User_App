import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_user_app/Custom/DetiledScreen/BottomBar.dart';
import 'package:event_user_app/Custom/DetiledScreen/weddingservices.dart';

import 'package:event_user_app/Utilities/deviceSize.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool isloading = false;
  final _eventdetailStream =
      FirebaseFirestore.instance.collection('events').snapshots();
  CollectionReference users = FirebaseFirestore.instance.collection('events');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _eventdetailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> document = querySnapshot.docs;
            List<Map> items = document.map((e) => e.data() as Map).toList();

            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  var thisItems = items[index];
                  return ListTile(leading: CircleAvatar(),
                    title: Text("${thisItems['eventname']}"),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Image Upload"),
      ),

    );
    // return Scaffold(
    //
    //   body: StreamBuilder(
    //       stream: _eventdetailStream,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasError) {
    //           return Text("Connection Error");
    //         }
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return Center(child: CircularProgressIndicator());
    //         }
    //         var docs = snapshot.data!.docs;
    //
    //         return ListView(children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Stack(
    //                 children: [
    //                   Container(
    //                     width: Helper.getScreenWidth(context),
    //                     height: 230,
    //                     decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                           image: AssetImage("lib/assets/weddinglogo.jpg"),
    //                           fit: BoxFit.cover),
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.all(10),
    //                     child: InkWell(
    //                       onTap: () {
    //                         Navigator.pop(context);
    //                       },
    //                       child: CircleAvatar(
    //                         backgroundColor: Colors.white.withOpacity(.5),
    //                         child: Icon(Icons.arrow_back),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(5),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       "",
    //                       style: TextStyle(
    //                           color: Colors.black,
    //                           fontWeight: FontWeight.w500,
    //                           fontSize: 30),
    //                     ),
    //                     SizedBox(
    //                       height: 10,
    //                     ),
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Row(
    //                           children: [
    //                             Icon(Icons.emoji_emotions_outlined),
    //                             SizedBox(
    //                               width: 10,
    //                             ),
    //                             Text(
    //                               "No reviews",
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: 15),
    //                             ),
    //                           ],
    //                         ),
    //                         Padding(
    //                           padding: const EdgeInsets.all(8.0),
    //                           child: Text(
    //                             "Reviews",
    //                             style: TextStyle(
    //                                 color: Colors.orange,
    //                                 fontSize: 15,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 5,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(left: 10, right: 10),
    //             child: Divider(
    //               thickness: .5,
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text(
    //               "Our Wedding Planning Services ",
    //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    //             ),
    //           )
    //
    //
    //           ,
    //           SizedBox(
    //             height: 10,
    //           ),
    //           WeddingServices(),
    //           WeddingServices(),
    //           WeddingServices(),
    //           WeddingServices(),
    //           WeddingServices(),
    //           WeddingServices(),
    //           WeddingServices(),
    //           WeddingServices(),
    //           WeddingServices(),
    //         ]);
    //       }),
    //   // body: SafeArea(
    //   //   child: ListView(
    //   //           children: [
    //   //             Column(
    //   //               crossAxisAlignment: CrossAxisAlignment.start,
    //   //               children: [
    //   //                 Stack(
    //   //                   children: [
    //   //                     Container(
    //   //                       width: Helper.getScreenWidth(context),
    //   //                       height: 230,
    //   //                       decoration: BoxDecoration(
    //   //                         image: DecorationImage(
    //   //                             image:
    //   //                                 AssetImage("lib/assets/weddinglogo.jpg"),
    //   //                             fit: BoxFit.cover),
    //   //                       ),
    //   //                     ),
    //   //                     Padding(
    //   //                       padding: const EdgeInsets.all(10),
    //   //                       child: InkWell(
    //   //                         onTap: () {
    //   //                           Navigator.pop(context);
    //   //                         },
    //   //                         child: CircleAvatar(
    //   //                           backgroundColor: Colors.white.withOpacity(.5),
    //   //                           child: Icon(Icons.arrow_back),
    //   //                         ),
    //   //                       ),
    //   //                     ),
    //   //                   ],
    //   //                 ),
    //   //                 Padding(
    //   //                   padding: const EdgeInsets.all(5),
    //   //                   child: Column(
    //   //                     crossAxisAlignment: CrossAxisAlignment.start,
    //   //                     children: [
    //   //                       Text(
    //   //                         "Wedding",
    //   //                         style: TextStyle(
    //   //                             color: Colors.black,
    //   //                             fontWeight: FontWeight.w500,
    //   //                             fontSize: 30),
    //   //                       ),
    //   //                       SizedBox(
    //   //                         height: 10,
    //   //                       ),
    //   //                       Row(
    //   //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   //                         children: [
    //   //                           Row(
    //   //                             children: [
    //   //                               Icon(Icons.emoji_emotions_outlined),
    //   //                               SizedBox(
    //   //                                 width: 10,
    //   //                               ),
    //   //                               Text(
    //   //                                 "No reviews",
    //   //                                 style: TextStyle(
    //   //                                     color: Colors.black, fontSize: 15),
    //   //                               ),
    //   //                             ],
    //   //                           ),
    //   //                           Padding(
    //   //                             padding: const EdgeInsets.all(8.0),
    //   //                             child: Text(
    //   //                               "Reviews",
    //   //                               style: TextStyle(
    //   //                                   color: Colors.orange,
    //   //                                   fontSize: 15,
    //   //                                   fontWeight: FontWeight.bold),
    //   //                             ),
    //   //                           ),
    //   //                         ],
    //   //                       ),
    //   //                     ],
    //   //                   ),
    //   //                 ),
    //   //               ],
    //   //             ),
    //   //             SizedBox(
    //   //               height: 5,
    //   //             ),
    //   //             Padding(
    //   //               padding: const EdgeInsets.only(left: 10, right: 10),
    //   //               child: Divider(
    //   //                 thickness: .5,
    //   //               ),
    //   //             ),
    //   //             Padding(
    //   //               padding: const EdgeInsets.all(8.0),
    //   //               child: Text(
    //   //                 "Our Wedding Planning Services ",
    //   //                 style:
    //   //                     TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    //   //               ),
    //   //             ),
    //   //             SizedBox(
    //   //               height: 10,
    //   //             ),
    //   //             WeddingServices(),
    //   //             WeddingServices(),
    //   //             WeddingServices(),
    //   //             WeddingServices(),
    //   //             WeddingServices(),
    //   //             WeddingServices(),
    //   //             WeddingServices(),
    //   //             WeddingServices(),
    //   //             WeddingServices(),
    //   //           ],
    //   //         ),
    //   // ),
    //   bottomNavigationBar: BottomButton(),
    // );
  }
}
