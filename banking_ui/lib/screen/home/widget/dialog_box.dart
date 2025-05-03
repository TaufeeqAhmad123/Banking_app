import 'package:banking_app/utils/appcolor.dart';
import 'package:banking_app/utils/images.dart';
import 'package:banking_app/widget/custom_clipper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Dialog DialogBox(BuildContext context,double value) {
   double slidervalue = value;
  return Dialog(
    backgroundColor: Colors.transparent,
    child: Stack(
      children: [
        ClipPath(
          clipper: dilogClipper(),
          child: Material(
            child: StatefulBuilder(
              builder: (context, setState) {
                //double slidervalue = value;
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 360,
                  height: 430,
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: AppColor.gradientColor2,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            AppIcons.budget,
                            scale: 2.5,
                            color: AppColor.kLine,
                          ),
                        ),
                      ),

                      Text(
                        'Set Monthly Budget',
                        style: GoogleFonts.oxygen(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColor.gradientColor2,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Monthly Budget',
                        style: GoogleFonts.oxygen(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.gradientColor2,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Amount \$ ',
                            style: GoogleFonts.oxygen(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.gradientColor2,
                            ),
                          ),
                          Text(
                            '${slidervalue.toStringAsFixed(0)}',
                            style: GoogleFonts.oxygen(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 114, 177, 4),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 20.0, // Increase track thickness
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ), // Bigger thumb
                          activeTrackColor: Colors.blue, // Bold active color
                          inactiveTrackColor: Colors.grey.shade400,
                          thumbColor: Colors.blue,
                          overlayColor: Colors.blue.withOpacity(0.2),
                        ),
                        child: Slider(
                          padding: EdgeInsets.all(20),
                          value: slidervalue,
                          min: 0,
                          max: 10000,
                          divisions: 100,
                          label: slidervalue.toStringAsFixed(0),
                          activeColor: AppColor.siyan,
                          onChanged: (newvalue) {
                            setState(() {
                              slidervalue = newvalue;
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                color: AppColor.siyan,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  'Set',
                                  style: GoogleFonts.oxygen(
                                    color: AppColor.gradientColor2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                slidervalue = 0;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                color: AppColor.gradientColor2,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  'Clear',
                                  style: GoogleFonts.oxygen(
                                    color: AppColor.kLine,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: -2,
          child: GestureDetector(
          onTap: () => Navigator.pop(context),
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                color: AppColor.siyan,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.gradientColor2,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(Icons.clear, color: AppColor.kWhite),
                  ),
                  SizedBox(width: 5),
                  SizedBox(width: 5),
                  Text(
                    'Closed',
                    style: GoogleFonts.oxygen(
                      color: AppColor.gradientColor2,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
