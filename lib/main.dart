import 'package:flutter/material.dart';

void main() {
  runApp(const IntensifySurveillanceSystem());
}

class IntensifySurveillanceSystem extends StatelessWidget {
  const IntensifySurveillanceSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Intensify Surveillance System',
          ),
        ),
      ),
    );
  }
}
