import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_user_app/Utilities/deviceSize.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String imageUrl = '';
  final CollectionReference _items =
      FirebaseFirestore.instance.collection('test');
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              width: Helper.getScreenWidth(context),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Create your item"),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: "Name", hintText: "jithus"),
                    ),
                    TextFormField(
                      controller: numberController,
                      decoration: InputDecoration(
                          labelText: "Number", hintText: "jithus"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconButton(
                        onPressed: () async {
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
                            await referenceImageToUpload
                                .putFile(File(file.path));
                            imageUrl =
                                await referenceImageToUpload.getDownloadURL();
                          } catch (error) {}
                        },
                        icon: Icon(Icons.camera)),
                    Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              if (imageUrl.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Select image"),
                                  ),
                                );
                                return;
                              }
                              final String name = nameController.text;
                              final String number = numberController.text;
                              if (number != null) {
                                await _items.add({
                                  "name": name,
                                  "number": number,
                                  "image": imageUrl,
                                });
                                nameController.text = "";
                                numberController.text = "";
                                Navigator.pop(context);
                              }
                            },
                            child: Text("Create")))
                  ]),
            ),
          );
        });
  }

  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stream = FirebaseFirestore.instance.collection('test').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: StreamBuilder<QuerySnapshot>(
    //     stream: _stream,
    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
    //       if (snapshot.hasError) {
    //         return Center(
    //           child: Text("Error"),
    //         );
    //       }
    //       if (snapshot.hasData) {
    //         QuerySnapshot querySnapshot = snapshot.data;
    //         List<QueryDocumentSnapshot> document = querySnapshot.docs;
    //         List<Map> items = document.map((e) => e.data() as Map).toList();
    //
    //         return ListView.builder(
    //             itemCount: items.length,
    //             itemBuilder: (context, index) {
    //               Map thisItems = items[index];
    //               return ListTile(leading: CircleAvatar(child:Image.network('${thisItems['image']}')),
    //                 title: Text("${thisItems['name']}"),
    //               );
    //             });
    //       }
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     },
    //   ),
    //   appBar: AppBar(
    //     title: Text("Image Upload"),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //       onPressed: () {
    //         _create();
    //       },
    //       child: Icon(Icons.add)),
    // );
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: Helper.getScreenHeight(context),
          width: Helper.getScreenHeight(context),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.purpleAccent, Colors.deepPurple.shade900],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              width:  Helper.getScreenHeight(context),
              decoration: BoxDecoration(color: Colors.white

                ),
              ),
          ),
          ),

      ],
    ));
  }
}
