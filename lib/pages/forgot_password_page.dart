import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_body_text.dart';
import '../components/my_button.dart';
import '../components/my_heading.dart';
import '../components/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  // text editing controller
  final emailController = TextEditingController();

  Future passwordReset() async {
    // try sending password reset email
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      showMessage('Password reset link sent to ${emailController.text.trim()}');
    } on FirebaseAuthException catch (exception) {
      // show error message
      showMessage(exception.message.toString());
    }
  }

  // message to user
  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              message,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
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
                const SizedBox(height: 40),

                const MyHeading(text: 'Forgotten Password'),

                const SizedBox(height: 40),

                // Enter your email and we will send you a password reset link!
                const MyBodyText(
                    text:
                        'Enter your email and we will send you a password reset link!'),

                const SizedBox(height: 20),

                // email textfeild
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 20),

                // reset password button
                MyButton(
                  buttonText: 'Reset Password',
                  onTap: passwordReset,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
