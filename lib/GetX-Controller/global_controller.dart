import 'dart:async';

import 'package:get/get.dart';
import 'package:mask_app/views/Covid19-Detection/onboarding.dart';
import 'package:mask_app/services.dart';

import '../model/cases_module.dart';

class GlobalController extends GetxController {
  Future<GlobalCases>? summary;
  CovidService covidService = CovidService();

  @override
  void onInit(){
    summary = covidService.getGlobalCases();
      super.onInit();
  }


}