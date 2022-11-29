import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page/utils/customColors.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({super.key});

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: CustomColors.customButtonColor,
        items: [
            _bottomNavigationBarItem(CupertinoIcons.house, "House"),
            _bottomNavigationBarItem(CupertinoIcons.search, "Search"),
            _bottomNavigationBarItem(Icons.video_library_outlined, "Reels"),
            _bottomNavigationBarItem(Icons.shopping_bag, "Shop"),
            _bottomNavigationBarItem(CupertinoIcons.person, "Profile")


      ]),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
          IconData iconData, String label) =>
      BottomNavigationBarItem(icon: Icon(iconData), label: label);
}
