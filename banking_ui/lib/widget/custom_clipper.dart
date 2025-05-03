import 'dart:ui';

import 'package:flutter/material.dart';

class myClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double width = size.width;
    final double height = size.height;

    path.moveTo(0, 0); // Start from top-left

    path.lineTo(width - 135, 0);
    // sharp cut inside from top-right

    path.lineTo(
      width - 105,
      height * 0.26,
    ); // down to bottom-right with slight margin

    path.lineTo(
      size.width,
      size.height * 0.26,
    ); 
  //here i want the border to be rounded not sharp
//     path.quadraticBezierTo(
//   width - 120, 0, // control point
//   width - 105, height * 0.28, // end point
// );

    path.lineTo(size.width, size.height); // Down to bottom-right
    path.lineTo(0, size.height); // Move to bottom-left
    path.close(); // Close
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
class dilogClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double width = size.width;
    final double height = size.height;

    path.moveTo(0, 0); // Start from top-left

    path.lineTo(width - 125, 0);
    // sharp cut inside from top-right

    path.lineTo(
      width - 100,
      height * 0.10,
    ); // down to bottom-right with slight margin

    path.lineTo(
      size.width,
      size.height * 0.10,
    ); 
  //here i want the border to be rounded not sharp
//     path.quadraticBezierTo(
//   width - 120, 0, // control point
//   width - 105, height * 0.28, // end point
// );

    path.lineTo(size.width, size.height); // Down to bottom-right
    path.lineTo(0, size.height); // Move to bottom-left
    path.close(); // Close
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
