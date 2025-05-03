import 'package:animate_do/animate_do.dart';
import 'package:banking_app/utils/appcolor.dart';
import 'package:banking_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class recentActivity extends StatelessWidget {
  const recentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColor.containerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return FadeInUp(
            delay: Duration(milliseconds: 300 + index * 100),
            child: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.gradientColor2,
                ),
                child: Center(
                  child: Image.asset(
                  items[index].image,
                    color: AppColor.kLine,
                    scale: 20,
                  ),
                ),
              ),
              title: Text(
              items[index].name,
                style: GoogleFonts.oxygen(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
               items[index].subtitle,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                items[index].amount,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.gradientColor2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Item {
  final String image;
  final String name;
  final String subtitle;
  final String amount;

  Item(
    {
    required this.image,
    required this.name,
    required this.amount,
    required this.subtitle,
  });
}

final List<Item> items = [
  Item(
   subtitle: 'Monday 25 September',
    image: AppIcons.food,
    name: "Food Store",
    amount: "-\$ 15.00",
  ),
  Item(
   subtitle: 'Monday 25 September',
    image: AppIcons.house,
    name: "House Rent",
    amount: "-\$ 15.00",
  ),
  Item(
   subtitle: 'Monday 25 September',
    image: AppIcons.store,
    name: "Shopping",
    amount: "-\$ 15.00",
  ),
  Item(
   subtitle: 'Monday 25 September',
    image: AppIcons.mobile,
    name: "Mobile shop",
    amount: "-\$ 15.00",
  ),
  Item(
  subtitle: 'Monday 25 September',
    image: AppIcons.food,
    name: "Food Store",
    amount: "-\$ 15.00",
  ),
];
