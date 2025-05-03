import 'package:animate_do/animate_do.dart';
import 'package:banking_app/model/user.dart';
import 'package:banking_app/screen/home/widget/action_row.dart';
import 'package:banking_app/screen/home/widget/card_widget.dart';
import 'package:banking_app/screen/home/widget/dialog_box.dart';
import 'package:banking_app/screen/home/widget/recent_activity.dart';
import 'package:banking_app/screen/home/widget/topwidget.dart';
import 'package:banking_app/screen/payment/send_payment.dart';
import 'package:banking_app/utils/appcolor.dart';
import 'package:banking_app/utils/images.dart';
import 'package:banking_app/utils/page_transition.dart';
import 'package:banking_app/widget/custom_clipper.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List icon = [
    AppIcons.wallet,
    AppIcons.recipt,
    AppIcons.mobile,
    AppIcons.more,
  ];
  List title = ['Send', 'Bill', 'Phone', 'More'];
  int isSelected = 0;
  double _sliderValue = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCFF2B3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 35),
              FadeInDown(
                delay: Duration(milliseconds: 500),
                child: topWidget(),
              ),
              SizedBox(height: 20),
              FadeIn(
                delay: Duration(milliseconds: 300),
                child: cardWidget(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogBox(context, _sliderValue);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 120,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColor.containerColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return FadeInRight(
                      delay: Duration(milliseconds: 300 + index * 100),
                      child: actionRow(
                        icon: icon[index],
                        title: title[index],
                        isSelected: isSelected == index,
                        onTap: () {
                          setState(() {
                            isSelected = index;
                          });
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 9),
                  itemCount: 4,
                ),
              ),
              SizedBox(height: 20),
              customRow(title: "Quick Send"),
              SizedBox(height: 10),
              Container(
                height: 107,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.containerColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListView.separated(
                  shrinkWrap: true,

                  scrollDirection: Axis.horizontal,
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    final user=userList[index];
                    return FadeInRight(
                      delay: Duration(milliseconds: 300 + index * 100),
                      child: GestureDetector(
                        onTap: () {
                          slideTransition(context, PaymentScreen(user: user,));
                        },

                        child: quickSendWidget(
                          image: user.image,
                          name: user.name,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 0),
                ),
              ),
              SizedBox(height: 10),
              customRow(title: "Recent Activity"),
              SizedBox(height: 10),
              recentActivity(),
            ],
          ),
        ),
      ),
    );
  }
}

class quickSendWidget extends StatelessWidget {
  final String image;
  final String name;
  const quickSendWidget({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
          Text(
            name,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.kGrayscale40,
            ),
          ),
        ],
      ),
    );
  }
}

class customRow extends StatelessWidget {
  final String title;
  const customRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.oxygen(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.gradientColor2,
          ),
        ),
        Spacer(),
        Text(
          "See all",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColor.gradientColor2,
          ),
        ),
        SizedBox(width: 5),
        Icon(Icons.arrow_forward_ios, color: AppColor.gradientColor2, size: 15),
      ],
    );
  }
}

class UsersData {
  final String name;
  final String image;
  UsersData(this.image, this.name);
}

final List<UsersData> userList = [
  UsersData(AppIcons.pic, 'Zala'),
  UsersData(AppIcons.pic1, 'William'),
  UsersData(AppIcons.pic2, 'Nora'),
  UsersData(AppIcons.pic3, 'Abey'),
  UsersData(AppIcons.pic4, 'Cristan'),
];
