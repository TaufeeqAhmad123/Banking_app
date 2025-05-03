import 'package:animate_do/animate_do.dart';
import 'package:banking_app/screen/home/home_screen.dart';
import 'package:banking_app/utils/appcolor.dart';
import 'package:banking_app/utils/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  final UsersData user;
  const PaymentScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  static String enteredAmount = '';

  final List<String> numbers = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '00',
    'Clear',
  ];

  void onNumberTap(String value) {
    setState(() {
      if (value == 'Clear') {
        if (enteredAmount.isNotEmpty) {
          enteredAmount = enteredAmount.substring(0, enteredAmount.length - 1);
        }
      } else {
        enteredAmount += value;
      }
    });
  }

  static String amount = "2674237";

  @override
  Widget build(BuildContext context) {
    int remainingBalance =
        int.parse(amount) -
        int.parse(enteredAmount.isEmpty ? "0" : enteredAmount);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        title: Text(
          'Send Payment',
          style: GoogleFonts.sahitya(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(AppIcons.more, scale: 16),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          const SizedBox(height: 20),
          ListTile(
            leading: FadeInLeft(
              delay: Duration(milliseconds: 300),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(widget.user.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: FadeInDown(
                   delay: Duration(milliseconds: 300),
              child: Text(

                widget.user.name,
                style: GoogleFonts.sahitya(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: FadeInDown(
                   delay: Duration(milliseconds: 300),
              child: Text('*** *** *** 345', style: GoogleFonts.sahitya())),
            trailing: FadeInRight(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.gradientColor2,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.kLine,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),

          Text(
            ' $enteredAmount',
            style: GoogleFonts.sahitya(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 70),
          FadeInUp(
                 delay: Duration(milliseconds: 300),
            child: Text(
              'Your balance $remainingBalance is remaining',
              style: GoogleFonts.sahitya(
                fontSize: 14,
                color: AppColor.kGrayscale40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
         
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                final item = numbers[index];
                return FadeInUp(
                       delay: Duration(milliseconds: 300 +index*100),
                  child: ElevatedButton(
                    onPressed: () => onNumberTap(item),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.backgroundColor,
                      elevation: 0,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: item == 'Clear'
                        ? const Icon(
                            Icons.backspace_outlined,
                            size: 28,
                            color: AppColor.gradientColor2,
                          )
                        : Text(
                            item,
                            style: GoogleFonts.sahitya(
                              fontSize: 25,
                              color: AppColor.gradientColor2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
