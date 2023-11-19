import 'package:event_user_app/Pages/EventDetailedPage.dart';
import 'package:flutter/material.dart';
class EventCards extends StatefulWidget {
   EventCards({super.key,required this.image,required this.title});

 final String image ;
 final String title;

  @override
  State<EventCards> createState() => _EventCardsState();
}

class _EventCardsState extends State<EventCards> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        InkWell(onTap: (){Navigator.push(
          context,
          MaterialPageRoute(builder: (builder) => EventDetails()),
        );},
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:10,right: 10,top: 10),
                child: Container(
                  height: 130,
                  width: 90,
                  decoration: BoxDecoration(boxShadow: [new BoxShadow(
                    color: Colors.black.withOpacity(.7),
                    blurRadius: 2.0,blurStyle: BlurStyle.outer
                  ),],

                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(widget.image),
                        fit: BoxFit.cover ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10,right: 10,top: 10,bottom: 5),
                child: Container(
                  height: 130,
                  width: 90,
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
        ),
        Text(widget.title),

      ],
    );
  }
}
