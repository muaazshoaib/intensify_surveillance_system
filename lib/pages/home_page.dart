import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

import '../components/my_body_text.dart';
import '../components/my_button.dart';
import '../components/my_heading.dart';
import '../models.dart';
import 'detect_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<CameraDescription> cameras;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await setupCameras();
  }

  loadModel(model) async {
    String? res;
    switch (model) {
      case yolo:
        res = await Tflite.loadModel(
          model: "assets/yolov2_tiny.tflite",
          labels: "assets/yolov2_tiny.txt",
        );

        // res = await Tflite.loadModel(
        //   model: "assets/custom_object_detection_yolov8_best_float16.tflite",
        //   labels: "assets/custom_object_detection_yolov8_best_float16.txt",
        // );

        break;

      case mobilenet:
        res = await Tflite.loadModel(
            model: "assets/mobilenet_v1_1.0_224.tflite",
            labels: "assets/mobilenet_v1_1.0_224.txt");
        break;

      case posenet:
        res = await Tflite.loadModel(
            model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
        break;

      default:
        res = await Tflite.loadModel(
            model: "assets/ssd_mobilenet.tflite",
            labels: "assets/ssd_mobilenet.txt");
    }
    log("$res");
  }

  onSelect(model) {
    loadModel(model);
    final route = MaterialPageRoute(builder: (context) {
      return DetectPage(cameras: cameras, model: model);
    });
    Navigator.of(context).push(route);
  }

  setupCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      log('Error: $e.code\nError Message: $e.message');
    }
  }

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

                MyButton(
                  buttonText: 'SSD',
                  onTap: () => onSelect(ssd),
                ),
                const SizedBox(height: 20),
                MyButton(
                  buttonText: 'YOLO',
                  onTap: () => onSelect(yolo),
                ),
                const SizedBox(height: 20),

                MyButton(
                  buttonText: 'MOBILENET',
                  onTap: () => onSelect(mobilenet),
                ),
                const SizedBox(height: 20),
                MyButton(
                  buttonText: 'POSENET',
                  onTap: () => onSelect(posenet),
                ),
                const SizedBox(height: 50),

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
