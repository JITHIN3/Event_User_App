import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
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
    return Container(
      child: CarouselSlider(
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
    );
  }
}
