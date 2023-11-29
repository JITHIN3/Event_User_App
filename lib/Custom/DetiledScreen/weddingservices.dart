import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class EventServices extends StatefulWidget {
  const EventServices({super.key});

  @override
  State<EventServices> createState() => _EventServicesState();
}
final _serviceStream =
FirebaseFirestore.instance.collection('services').snapshots();
class _EventServicesState extends State<EventServices> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _serviceStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Connection Error");
        }
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator());
        }
        var docs = snapshot.data!.docs;
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                      Text("Photo & Videography",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      Text("Still And Video",style: TextStyle(fontSize: 14,color: Colors.grey),),
                      Text("Ngxg fsfsas sd",style: TextStyle(fontSize: 13,color: Colors.grey),),

                    ]),),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5,bottom: 5),
                child: Divider(thickness: .5,),
              ),

            ],
          ),
        );
      }
    );
  }
}
