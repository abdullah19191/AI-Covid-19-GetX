import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/onboardingmodel.dart';

class   OnboardController extends GetxController {

  List<SliderModel> slides = <SliderModel>[];
  var currentIndex = 0.obs;
  var pageController = PageController();
  forwardPage(){
    pageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
}

  @override
  void onInit(){
    slides = getSlides();
    super.onInit();
  }


}