import 'package:flutter/material.dart';
class WeddingServices extends StatelessWidget {
  const WeddingServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black.withOpacity(.7),
                            blurRadius: 1.0,
                            blurStyle: BlurStyle.outer),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage("lib/assets/camera.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  // Container(
                  //   height: 90,
                  //   width: 90,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       gradient: LinearGradient(colors: [
                  //         Colors.blueAccent.withOpacity(0.3),
                  //         Colors.redAccent.withOpacity(0.3)
                  //       ])),
                  // )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                  Text("Photo & Videography",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  Text("Still And Video",style: TextStyle(fontSize: 14,color: Colors.grey),),
                  Text("Ngxg fsfsas sd",style: TextStyle(fontSize: 13,color: Colors.grey),),

                ]),),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 5),
            child: Divider(thickness: .5,),
          )
        ],
      ),
    );
  }
}
