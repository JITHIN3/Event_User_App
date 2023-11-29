import 'package:event_user_app/Pages/Home.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 150,
              height: 100,
              child: Image(
                image: AssetImage("lib/assets/check.png"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Booking Successfull",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(onTap: (){
            Navigator.push(context,MaterialPageRoute(builder:(builder)=>HomeScreen()));
          },
            child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Go to Home',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
