

import 'package:banking_app/widget/bottom_navbar.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      debugShowCheckedModeBanner: false,
     
      routes: {
        '/': (context) =>  BottomNavbar(),
      }
     
    );
  }
}
