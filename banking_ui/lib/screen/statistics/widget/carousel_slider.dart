import 'package:banking_app/utils/appcolor.dart';
import 'package:banking_app/utils/const.dart';
import 'package:banking_app/utils/images.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  CarouselSliderController _carouselController = CarouselSliderController();

  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.siyan,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.KdividerColor.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CarouselSlider(
        carouselController: _carouselController,
        options: CarouselOptions(
          height: 250,

          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          initialPage: 0,
          onPageChanged: (index, _) {
            setState(() {
              isSelected = index;
            });
          },
        ),
        items: statisticsData.map((e) {
          return Builder(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(AppIcons.trendup, height: 30, width: 30),
                      SizedBox(width: 10),
                      Text(
                        'Earnings',
                        style: GoogleFonts.oxygen(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColor.kGrayscaleDark100,
                        ),
                      ),
                      SizedBox(width: 25),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.gradientColor2,
                        ),
                        child: Icon(
                          Icons.more_horiz_outlined,
                          color: AppColor.kLine,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    e['title'] ?? '',
                    style: GoogleFonts.oxygen(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.kGrayscaleDark100,
                    ),
                  ),
                  Text(
                    e['description'] ?? '',
                    style: GoogleFonts.oxygen(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.kGrayscaleDark100,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Goal ${e['goal'] ?? ''}",
                    style: GoogleFonts.oxygen(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColor.kGrayscaleDark100,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: Wrap(
                      children: List.generate(4, (index) {
                        return Container(
                          height: 10,
                          margin: const EdgeInsets.only(right: 5),
                          width: isSelected == index ? 30 : 10,
                          decoration: BoxDecoration(
                            color: isSelected == index
                                ? AppColor.gradientColor2
                                : AppColor.kGrayscale40,
                            borderRadius: BorderRadius.circular(20),
                            //shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
