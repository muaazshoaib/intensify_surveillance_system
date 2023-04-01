import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intensify_surveillance_system/screens/display_picture_screen.dart';

late List<CameraDescription> cameras;

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
  });

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      cameras.first,
      ResolutionPreset.ultraHigh,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(children: [
              CameraPreview(_controller),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await _initializeControllerFuture;

                      final image = await _controller.takePicture();

                      if (!mounted) return;

                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DisplayPictureScreen(
                            imagePath: image.path,
                          ),
                        ),
                      );
                    } catch (e) {
                      if (kDebugMode) {
                        print(e);
                      }
                    }
                  },
                  // child: const Icon(Icons.camera_alt),
                  child: const Icon(Icons.camera_alt),
                ),
              )
            ]);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     try {
      //       await _initializeControllerFuture;
      //
      //       final image = await _controller.takePicture();
      //
      //       if (!mounted) return;
      //
      //       await Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (context) => DisplayPictureScreen(
      //             imagePath: image.path,
      //           ),
      //         ),
      //       );
      //     } catch (e) {
      //       if (kDebugMode) {
      //         print(e);
      //       }
      //     }
      //   },
      //   child: const Icon(Icons.camera_alt),
      // ),
    );
  }
}
