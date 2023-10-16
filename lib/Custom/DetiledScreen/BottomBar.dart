import 'package:event_user_app/Utilities/deviceSize.dart';
import 'package:flutter/material.dart';
class BottomButton extends StatefulWidget {
  const BottomButton({super.key});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(surfaceTintColor: Colors.transparent,child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

      Container(
        margin: EdgeInsets.only(),
        height: 50,
        width: Helper.getScreenWidth(context)*.43,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

            color: Colors.deepOrange
        ),
        child: Center(
            child:   Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Icon(Icons.chat,color: Colors.white,size:20,),
                ),
                SizedBox(width: 8,),
                Text(
                  "Chat",
                  style: TextStyle(
                    color: Colors.white, fontSize:17,),
                ),

              ],
            )),
      ),
      Container(
        margin: EdgeInsets.only(left: 8),
        height: 50,
        width: Helper.getScreenWidth(context)*.43,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepOrange
        ),
        child: Center(
            child:   Text(
              "Book Now",
              style: TextStyle(
                color: Colors.white, fontSize:17,),
            )),
      ),

    ]),);
  }
}
