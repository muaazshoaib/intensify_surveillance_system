import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      // () => Navigator.pushReplacementNamed(context, '/home'),
      () => Navigator.pushReplacementNamed(context, '/login'),
      // () => Navigator.pushReplacementNamed(context, '/signup'),
      // () => Navigator.pushReplacementNamed(context, '/forgotten_password'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 150,
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text('Intensify Surveillance System'),
            ),
          ],
        ),
      ),
    );
  }
}
