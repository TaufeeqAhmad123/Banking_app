import 'package:banking_app/screen/home/home_screen.dart' show HomeScreen;
import 'package:banking_app/screen/statistics/statistic_screen.dart';
import 'package:banking_app/utils/appcolor.dart';
import 'package:banking_app/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(), // make sure HomeScreen has padding at bottom
    const Center(child: Text('Search')),
    const StatisticScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// Main screen content
          Positioned.fill(child: pages[currentIndex]),

          /// Bottom navigation bar over the content
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.symmetric(horizontal: 100),
              decoration: BoxDecoration(
                color: AppColor.gradientColor2,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navItem(icon: AppIcons.home1, index: 0),
                  navItem(icon: AppIcons.scanner, index: 1),
                  navItem(icon: AppIcons.dot, index: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget navItem({required String icon, required int index}) {
    final bool isActive = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: AnimatedContainer(
        height: 60,width: 60,
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppColor.siyan : Colors.transparent,
        ),
        child: Image.asset(
          icon,
          height: 30,
          width: 30,
          color: isActive ? Colors.black : Colors.grey.shade300,
        ),
      ),
    );
  }
}
