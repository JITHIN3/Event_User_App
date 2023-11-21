import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_user_app/Utilities/deviceSize.dart';
import 'package:flutter/material.dart';

class ManageEvents extends StatefulWidget {
  const ManageEvents({super.key});

  @override
  State<ManageEvents> createState() => _ManageEventsState();
}

class _ManageEventsState extends State<ManageEvents> {
  final _manageEventStream =
      FirebaseFirestore.instance.collection('events').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
                        colors: [
                          Colors.purpleAccent,
                          Colors.deepPurple.shade900
                        ],
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(.5),
                                child: Icon(Icons.arrow_back),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Text("Manage Events ",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white.withOpacity(.7))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Edit Your Events",
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
                              child: Column(children: [

                                StreamBuilder(
                                    stream: _manageEventStream,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError) {
                                        return Text("Connection Error");
                                      }
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return Center(child: CircularProgressIndicator());
                                      }
                                      var docs = snapshot.data!.docs;
                                      return ListView.builder(shrinkWrap: true,itemCount: docs.length,itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 20, top: 10, bottom: 10),
                                              width: Helper.getScreenWidth(context),
                                              height: 100,
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
                                                            Text('${docs[index]['eventname']}', style: TextStyle(fontSize: 22)),
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

                                                        Text("Services : ${docs[index]['services']} ",
                                                            style: TextStyle(fontSize: 15)),
                                                      ]),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                    }),

                              ]),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),



    );


  }
  void delete(id) {
    FirebaseFirestore.instance.collection('events').doc(id).delete();
  }
  void _showAlertDialog(BuildContext context,snapshot,index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete'),
          content: Text('Are You Sure Delete This Event?'),
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
