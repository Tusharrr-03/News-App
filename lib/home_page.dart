import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app_ui/Bottom%20Navigation/nav_home_page.dart';

List<Widget> navPages = [
  NavHomePage(),
  NavHomePage(),
  NavHomePage(),
  NavHomePage(),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: navPages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.blue,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
            label: "Home",
          ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.global),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.bookmark),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.setting),
              label: "Settings",
            ),
          ],
          currentIndex: selectedIndex,
        onTap: (value){
          selectedIndex = value;
          setState(() {

          });
        },
      ),
    );
  }
}
