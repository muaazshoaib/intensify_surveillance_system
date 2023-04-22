import 'dart:async';

import 'package:flutter/material.dart';

import '../components/my_body_text.dart';
import '../components/my_heading.dart';
import 'auth_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const AuthPage();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                MyHeading(text: 'Intensify Surveillance System'),
                SizedBox(height: 40),
                MyBodyText(text: 'Splash Screen'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
