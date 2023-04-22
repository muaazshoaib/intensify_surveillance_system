import 'package:flutter/material.dart';

class MyBodyText extends StatelessWidget {
  const MyBodyText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 16,
        ),
      ),
    );
  }
}
