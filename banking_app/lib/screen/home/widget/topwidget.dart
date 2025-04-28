import 'package:banking_app/utils/appcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

class topWidget extends StatelessWidget {
  const topWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.containerColor1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: AppColor.imagebackgroundcilor,
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Welcome, Arina',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    color: AppColor.kLine,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'your wallet--Grey',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    color: AppColor.kGrayscale40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: AppColor.siyan,
              child: Icon(
                CupertinoIcons.add,
                color: AppColor.gradientColor2,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
