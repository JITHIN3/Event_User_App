import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_user_app/Pages/SignUp.dart';
import 'package:event_user_app/Service/Auth_Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List category = [
    "GROCERY",
    "ELECTRONICS",
    "COSMETICS",
    "FASHIONS",
    "PHARMACY"
  ];

  final List images = [
    "https://cdn.pixabay.com/photo/2016/11/22/19/08/hangers-1850082_640.jpg",
    "https://cdn.pixabay.com/photo/2015/09/21/14/24/supermarket-949913_640.jpg",
    "https://cdn.pixabay.com/photo/2016/04/08/18/46/shopping-mall-1316787_640.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/19/08/hangers-1850082_640.jpg",
    "https://cdn.pixabay.com/photo/2015/09/21/14/24/supermarket-949913_640.jpg",
    "https://cdn.pixabay.com/photo/2016/04/08/18/46/shopping-mall-1316787_640.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "HOME SCREEN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              CarouselSlider(
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
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "TITLE",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
                    .toList(),
                options: CarouselOptions(height: 200, autoPlay: true),
              ),

            ],
          ),
        ),
      ),
    );
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
