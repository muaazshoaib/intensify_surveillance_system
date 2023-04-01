import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:intensify_surveillance_system/screens/display_picture_screen.dart';
import 'package:intensify_surveillance_system/screens/forgotten_password_screen.dart';
import 'package:intensify_surveillance_system/screens/home_screen.dart';
import 'package:intensify_surveillance_system/screens/login_screen.dart';
import 'package:intensify_surveillance_system/screens/signup_screen.dart';
import 'package:intensify_surveillance_system/screens/splash_screen.dart';
import 'package:intensify_surveillance_system/screens/take_picture_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const IntensifySurveillanceSystem());
}

class IntensifySurveillanceSystem extends StatelessWidget {
  const IntensifySurveillanceSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/forgotten_password': (context) => const ForgottenPasswordScreen(),
        '/take_picture_screen': (context) => const TakePictureScreen(),
        '/display_picture_screen': (context) => const DisplayPictureScreen(
              imagePath: '',
            ),
      },
    );
  }
}
