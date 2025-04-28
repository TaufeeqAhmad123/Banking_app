import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/signin');
    });
  }

  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(child: Image.asset('assets/acc.png'),
            from: 100,
            duration: const Duration(milliseconds: 800),
            ),

            
            const SizedBox(height: 20),
            FadeInRight(
              child: Text(
                'Secure Banking',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            FadeInLeft(
              duration: const Duration(milliseconds: 800),
              child: const Text(
                'Your Money, Your Control',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
