import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page/utils/customColors.dart';
import 'package:page/widgets/custom_app_bar.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({super.key});

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Coffee Shop"),
      bottomNavigationBar: customBottomNavigationBar(),
    );
  }

  BottomNavigationBar customBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: CustomColors.customButtonColor,
      unselectedItemColor: CustomColors.darkButtonColor ,
      items: [
          _bottomNavigationBarItem(CupertinoIcons.house, "House"),
          _bottomNavigationBarItem(CupertinoIcons.search, "Search"),
          _bottomNavigationBarItem(Icons.video_library_outlined, "Reels"),
          _bottomNavigationBarItem(Icons.shopping_bag_outlined, "Shop"),
          _bottomNavigationBarItem(CupertinoIcons.person, "Profile")


    ]);
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
          IconData iconData, String label) =>
      BottomNavigationBarItem(icon: Icon(iconData), label: label);
}
