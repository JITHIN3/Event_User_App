import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_user_app/Pages/SignUp.dart';
import 'package:event_user_app/Service/Auth_Service.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthClass authClass = AuthClass();
  List category = [
    "GROCERY",
    "ELECTRONICS",
    "COSMETICS",
    "FASHIONS",
    "PHARMACY"
  ];

  final List images = [
    "https://www.mbatuts.com/wp-content/uploads/2019/11/Event-Planning-Business-in-plan.jpg",
    "https://im.hunt.in/local/Gallery/3102080/l/3102080_d2ca5.jpg",
    "https://www.hyderabadevents.com/assets/uploads/e0733afe5127c9fb14e8e92a573e2a01.jpg",
    "https://kevinmauermann.com/wp-content/uploads/kevinmauermann-com/sites/221/1-1080x675.jpg",
    "https://www.filepicker.io/api/file/wQ03Z8fkRfmtBqq58HVf",
    "https://content.jdmagicbox.com/comp/ernakulam/m4/0484px484.x484.140206113128.a9m4/catalogue/we-create-events-panampilly-nagar-ernakulam-event-management-companies-nsobpzm660.jpg?clr="
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              CarouselSlider(
                carouselController: CarouselController(),
                items: images
                    .map(
                      (e) => Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  e,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 200,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(colors: [
                                    Colors.blueAccent.withOpacity(0.3),
                                    Colors.redAccent.withOpacity(0.3)
                                  ])),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
                options: CarouselOptions(height: 200, autoPlay: true),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Make Your Event",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListView(physics: ScrollPhysics(),shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(height: 100,width: 80,
                          decoration: BoxDecoration(color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(height: 100,width: 80,
                          decoration: BoxDecoration(color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(height: 100,width: 80,
                          decoration: BoxDecoration(color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
             
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      drawer: Nav(),
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
