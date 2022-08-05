import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mask_app/views/Covid19-Detection/onboarding.dart';
import 'package:mask_app/utility/Splash.dart';
import 'package:get/get.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaskApp());
}

class MaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      getPages: [
        GetPage(name: '/onboarding', page: () => OnboardScreen()),
      ],
    );
  }
}
