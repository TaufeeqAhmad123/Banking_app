import 'package:animate_do/animate_do.dart';
import 'package:banking_app/utils/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SizedBox topRowWidget(List string, int isSelected, Function onTap) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: string.length,
        itemBuilder: (context, index) {
          return FadeInRight(
                 delay: Duration(milliseconds: 300 + index *100),
            child: GestureDetector(
              onTap: () {
               onTap(index);
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected == index ? AppColor.siyan : AppColor.kWhite,
                ),
                child: Center(
                  child: Text(
                    string[index],
                    style: GoogleFonts.oxygen(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColor.kGrayscaleDark100,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
