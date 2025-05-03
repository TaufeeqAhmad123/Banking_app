import 'package:banking_app/utils/appcolor.dart';
import 'package:banking_app/utils/images.dart';
import 'package:banking_app/widget/custom_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class cardWidget extends StatelessWidget {
  void Function()? onTap;
   cardWidget({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipPath(
            clipper: myClipper(),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.kWhite,
                image: DecorationImage(
                  image: AssetImage(AppIcons.card),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/visa.png',
                          scale: 12,
                          color: AppColor.kLine,
                        ),
                        Text(
                          'Balance',
                          style: GoogleFonts.plusJakartaSans(
                            color: AppColor.kGrayscale40,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$24,345.75',
                          style: GoogleFonts.abrilFatface(
                            color: AppColor.kLine,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          '***** **** **** 1234',
                          style: GoogleFonts.plusJakartaSans(
                            color: AppColor.kLine,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Willian current',
                              style: GoogleFonts.plusJakartaSans(
                                color: AppColor.kLine,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 110),

                            Text(
                              'Exp 12/25',
                              style: GoogleFonts.plusJakartaSans(
                                color: AppColor.kLine,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Container(
                        height: 140,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppColor.siyan,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Icon(CupertinoIcons.scribble, size: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child:GestureDetector(
              onTap: onTap,
              child: Container(
                height: 40,
                width: 110,
                decoration: BoxDecoration(
                  color: AppColor.siyan,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                  color: AppColor.gradientColor2,
                  borderRadius: BorderRadius.circular(30),
                ),
                      child: Icon(Icons.add, color: AppColor.kWhite)),
                    SizedBox(width: 5),
                    Text(
                      'Budget',
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
}

//  ElevatedButton.icon(
//               onPressed: () {
//                 // TODO: Handle Set Budget functionality here
//               },
//               icon: Container(
               
              
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                 shape: BoxShape.circle,
//                 ),
//                 child: Center(child: Icon(Icons.add, color: Colors.white))),
//               label: Text(' Budget', style: TextStyle(color: Colors.black)),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xffC7F464), // Light green background
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 fixedSize: Size(100, 40),
//                 //  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 elevation: 2,
//               ),
//             ),