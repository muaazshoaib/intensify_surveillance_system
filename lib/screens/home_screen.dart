import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.camera_alt,
              size: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/take_picture_screen');
              },
              child: const Text('Open Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
