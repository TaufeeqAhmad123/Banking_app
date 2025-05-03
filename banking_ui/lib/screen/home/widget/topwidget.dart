import 'package:banking_app/utils/appcolor.dart';
import 'package:banking_app/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class topWidget extends StatelessWidget {
  const topWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: AppColor.imagebackgroundcilor,
              backgroundImage: AssetImage(AppIcons.user1),
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'William Current',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    color: AppColor.gradientColor2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Welcome Back',
                  style: GoogleFonts.allerta(
                    fontSize: 18,
                    color: AppColor.gradientColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.bell,
              color: AppColor.gradientColor2,
            ),
          ),
        ],
      ),
    );
  }
}
