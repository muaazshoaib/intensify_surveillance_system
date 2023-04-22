import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intensify_surveillance_system/pages/splash_page.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const IntensifySurveillanceSystem());
}

class IntensifySurveillanceSystem extends StatelessWidget {
  const IntensifySurveillanceSystem({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
