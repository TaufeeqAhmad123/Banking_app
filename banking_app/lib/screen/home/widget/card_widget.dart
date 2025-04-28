import 'package:banking_app/utils/appcolor.dart';
import 'package:flutter/material.dart';

class cardWidget extends StatelessWidget {
  const cardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.blueColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(children: [
            Text('Visa')
          ],
        ),
      ),
    );
  }
}