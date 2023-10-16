import 'package:flutter/material.dart';
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(backgroundColor:Colors.white,animationDuration: Duration(seconds: 3),
      onDestinationSelected: (int index) {

      },
      indicatorColor: Colors.amber[800],

      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),

        NavigationDestination(
          selectedIcon: Icon(Icons.chat_bubble),
          icon: Icon(Icons.chat_bubble),
          label: 'Chat',
        ),
      ],
    );
  }
}
