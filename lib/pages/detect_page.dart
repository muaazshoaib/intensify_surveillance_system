import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../components/bndbox.dart';
import '../components/camera.dart';

class DetectPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String model;

  const DetectPage({super.key, required this.cameras, required this.model});

  @override
  State<DetectPage> createState() => _DetectPageState();
}

class _DetectPageState extends State<DetectPage> {
  List<dynamic>? _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Camera(
            widget.cameras,
            widget.model,
            setRecognitions,
          ),
          BndBox(
              _recognitions ?? [],
              math.max(_imageHeight, _imageWidth),
              math.min(_imageHeight, _imageWidth),
              screen.height,
              screen.width,
              widget.model),
        ],
      ),
    );
  }
}
