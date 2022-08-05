import 'dart:async';

import 'package:get/get.dart';
import 'package:mask_app/views/Covid19-Detection/onboarding.dart';

class SplashController extends GetxController {


@override
void onInit(){
  nextscreen();
  super.onInit();
}


  Future<Timer> nextscreen() async {
    return  Timer (
        Duration(seconds: 10),
            () => Get.to(()=> OnboardScreen()));
}
}