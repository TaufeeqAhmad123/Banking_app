import 'package:animate_do/animate_do.dart';
import 'package:banking_app/screen/home/widget/card_widget.dart';
import 'package:banking_app/screen/home/widget/topwidget.dart';
import 'package:banking_app/utils/appcolor.dart';
import 'package:banking_app/widget/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.gradientColor1, AppColor.gradientColor2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                topWidget(),
                cardWidget(),
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FadeInUp(
                      delay: Duration(milliseconds: index * 100),
                      child: transactionHistory(
                        color: index.isEven
                            ? AppColor.yellowColor
                            : AppColor.blueColor,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




class transactionHistory extends StatelessWidget {
  final Color color;
  const transactionHistory({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.blueColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              CupertinoIcons.bandage,
              color: AppColor.kWhite,
              size: 30,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Current Account'),
              Text(' Account No'),
              Text(' 1234-5678-9087'),
            ],
          ),
          trailing: Column(
            children: [Text('Rs 100000'), Text('Available Balance')],
          ),
        ),
      ),
    );
  }
}
