import 'package:banking_app/utils/appcolor.dart';
import 'package:flutter/material.dart';

class actionRow extends StatelessWidget {
  final String icon;
  final String title;
  void Function()? onTap;
  bool isSelected;
  actionRow({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColor.siyan : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, height: 50, width: 40),
            Text(
              title,
              style: TextStyle(
                color: AppColor.gradientColor2,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

