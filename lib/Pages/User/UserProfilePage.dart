import 'package:event_user_app/Utilities/deviceSize.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(clipBehavior: Clip.none, children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: Helper.getScreenWidth(context),
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.white,
                          Colors.blue,

                          Colors.blueAccent,

                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "Edit Profile",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          leading: InkWell(
                              child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onTap: (){
                                Navigator.pop(context);
                          },),
                        )
                      ],
                    )),
                Positioned(
                  top: 130,
                  left: 130,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage("lib/assets/img.png"),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Positioned(
                  top: 220,
                  left: 220,
                  child: Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.black.withOpacity(.7),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Name", suffixIcon: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        suffixIcon: Icon(Icons.email_outlined)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Phone",
                        suffixIcon: Icon(Icons.phone_android)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Place"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ]),
              ),
              SizedBox(
                height: 100,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  height: 50,
                  width: Helper.getScreenWidth(context) * .43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white,
                        Colors.blue,

                        Colors.blue,
                        Colors.blue,


                    ],
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
