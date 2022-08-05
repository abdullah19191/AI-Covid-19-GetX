import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_app/views/Covid19-Detection/onboarding.dart';
import 'package:mask_app/model/countrymodel.dart';

import '../model/countrylistmodel.dart';
import '../services.dart';

class CountryController extends GetxController {
var countryList = Future.value(<CountryModel>[]).obs;
var summaryList = Future.value(<CountrySummaryModel>[]).obs;
CovidService covidService = CovidService();
final  textAheadController = TextEditingController();

@override
void onInit() {
  super.onInit();
  fetchCountryCases();
  this.textAheadController.text = "Pakistan";
}
Future<List<CountryModel>> api() async{
  var _countryList = await covidService.getCountryList();
  return _countryList;
}

Future<List<CountrySummaryModel>> Api() async{
  var _summaryList = await covidService.getCountrySummary("Pakistan");
  return _summaryList;
}


 void fetchCountryCases() async{
     countryList.value = api();
     summaryList.value = Api();
   }



  List<String> getSuggestions(List<CountryModel> list, String query){
     List<String> matches  = [];
    for(var item in list){
      matches.add(item.country);
    }
    matches.retainWhere((element) => element.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
 }

