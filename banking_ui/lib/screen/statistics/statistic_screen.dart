import 'package:animate_do/animate_do.dart';
import 'package:banking_app/screen/statistics/widget/chart_widget.dart';
import 'package:banking_app/screen/statistics/widget/overview_widget.dart';
import 'package:banking_app/screen/statistics/widget/top_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:banking_app/screen/statistics/widget/carousel_slider.dart'; // your custom
import 'package:banking_app/utils/appcolor.dart';
import 'package:banking_app/utils/images.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  CarouselSliderController _carouselController = CarouselSliderController();
  List<String> string = ['Today', 'Week', 'Month', 'Year'];
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              'Statistics',
              style: GoogleFonts.oxygen(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColor.kGrayscaleDark100,
              ),
            ),
            const SizedBox(height: 10),
            topRowWidget(string, isSelected, (int index) {
              setState(() {
                isSelected = index;
              });
            }),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: FadeInLeft(
                    delay: Duration(milliseconds: 300),
                    child: CarouselSliderWidget(),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: FadeInRight(
                    delay: Duration(milliseconds: 300),
                    child: Container(
                      height: 251,
                      decoration: BoxDecoration(
                        color: AppColor.gradientColor2,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.KdividerColor.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppIcons.trenddouwn,
                                  height: 30,
                                  width: 30,
                                  color: AppColor.siyan,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Earnings',
                                  style: GoogleFonts.oxygen(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.siyan,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.siyan,
                                  ),
                                  child: Icon(
                                    Icons.more_horiz_outlined,
                                    color: AppColor.gradientColor2,
                                    size: 27,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '\$2,500',
                              style: GoogleFonts.oxygen(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColor.siyan,
                              ),
                            ),
                            Image.asset(
                              'assets/line.jpg',
                              height: 110,
                              width: 200,
                              //color: AppColor.siyan,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/key.png',
                                  height: 18,
                                  width: 18,
                                  color: AppColor.siyan,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  'Credit card',
                                  style: GoogleFonts.oxygen(
                                    color: AppColor.kLine,
                                    fontSize: 12
                                    
                                  ),
                                ),
                                 SizedBox(width: 5),
                                Image.asset(
                                  'assets/key.png',
                                  height: 18,
                                  width: 18,
                                  color: AppColor.blueColor,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  'Debit card',
                                  style: GoogleFonts.oxygen(
                                    color: AppColor.kLine,
                                     fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Column(
                  children: [
                    FadeInUp(
                      delay: Duration(milliseconds: 300),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Overview',
                            style: GoogleFonts.oxygen(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.kGrayscaleDark100,
                            ),
                          ),
                          Icon(
                            Icons.swap_horiz_outlined,
                            color: AppColor.kGrayscaleDark100,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      delay: Duration(milliseconds: 300),
                      child: overviewWidget(),
                    ),
                    SizedBox(height: 20),
                    Spacer(),
                    SizedBox(height: 250, child: buildChart(isSelected)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Top Row Widget

  // Chart Builder
}
