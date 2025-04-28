import 'package:flutter/material.dart';

void slideTransition(BuildContext context, Widget page) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondryAnimation) => page,
      transitionsBuilder: (context, animation, scondaryAnimation, child) {
        const begin = Offset(1.1, 0.0);
        const end = Offset.zero;
        Duration duration = const Duration(milliseconds: 800);  
        const curve = Curves.easeInOut;
        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(child: child, position: offsetAnimation);
      },
    ),
  );
}
