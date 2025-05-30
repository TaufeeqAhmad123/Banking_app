
import 'package:banking_app/utils/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTab,
    required this.subtitleTextStyle,
  });
  final String title, subtitle;
  final TextStyle subtitleTextStyle;
  final VoidCallback onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: title,
          style:
              GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColor.kWhite,
              ).copyWith(
                color: AppColor.kGrayscale40,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
          children: <TextSpan>[
            TextSpan(text: subtitle, style: subtitleTextStyle),
          ],
        ),
      ),
    );
  }
}