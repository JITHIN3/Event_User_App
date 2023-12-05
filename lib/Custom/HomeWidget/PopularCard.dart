import 'package:event_user_app/Utilities/deviceSize.dart';
import 'package:flutter/material.dart';

class PopularCard extends StatefulWidget {
  const PopularCard({super.key});

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.only(left:10,right: 10,bottom: 10)
          ,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Center(
              child: Container(
                width: Helper.getScreenWidth(context),
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent.withOpacity(0.3),
                        Colors.redAccent.withOpacity(0.3)
                      ],
                    ),
                    image: DecorationImage(
                        image: AssetImage(
                          "lib/assets/weddinglogo.jpg",
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 5,),
            Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text("Wedding",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                Row(children: [
                  Text("5",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15)),
                  Icon(Icons.star,color: Colors.yellow,size: 15,)
                ],),
              ],),
            ),
            Text("Destination Wedding,Northindian Wedding...",style: TextStyle(color: Colors.grey,fontSize: 13),),
            SizedBox(height: 20,)
          ]
          ),
        )
      ],
    );
  }
}
