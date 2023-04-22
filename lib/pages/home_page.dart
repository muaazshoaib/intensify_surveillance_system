import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_body_text.dart';
import '../components/my_button.dart';
import '../components/my_heading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
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
              children: [
                const MyHeading(text: 'Home'),
                const SizedBox(height: 40),
                MyBodyText(text: 'Logged in as ${user.email!}'),

                const SizedBox(height: 20),

                // sign out button
                MyButton(
                  buttonText: 'Sign Out',
                  onTap: signUserOut,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
