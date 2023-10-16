import 'package:flutter/material.dart';
class PopularCard extends StatefulWidget {
  const PopularCard({super.key});

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
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
                          image: AssetImage("lib/assets/northindain.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(colors: [
                          Colors.blueAccent.withOpacity(0.3),
                          Colors.redAccent.withOpacity(0.3)
                        ])),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                  Text("North Indian Wedding",style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                  Text("North Indian Wedding",style: TextStyle(fontSize: 14,color: Colors.grey),),
                  Text("Ngxg fsfsas sd",style: TextStyle(fontSize: 13,color: Colors.grey),),

                  Row(
                    children: [
                      Text("4.3",style:TextStyle( fontSize: 13,fontWeight: FontWeight.w400)),
                      Icon(Icons.star,size: 14,color: Colors.orangeAccent,)
                    ],
                  )
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
