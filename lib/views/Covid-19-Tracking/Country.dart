import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mask_app/model/countrylistmodel.dart';
import 'package:mask_app/model/countrymodel.dart';
import 'package:mask_app/views/Covid-19-Tracking/CountryUI.dart';
import 'package:mask_app/utility/loading.dart';
import '../../GetX-Controller/country_controller.dart';
import '../../services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

CovidService covidService = CovidService();



class CountryScreen extends StatelessWidget {
  CountryScreen({Key? key}) : super(key: key);
 final CountryController countryController = Get.put(CountryController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Obx( ()=> FutureBuilder(
            future: countryController.countryList.value,
            builder:(context,AsyncSnapshot   snapshot){
              if(snapshot.hasError)
                return Center(child: Text("Error"),);
              switch(snapshot.connectionState){
                case ConnectionState.waiting:
                  return Loading(inputTextLoading: true);
                default:
                  return !snapshot.hasData?
                  Center(child: Text("Empty"),):
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
                        child: Text(
                          "Type the country name",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: countryController.textAheadController,
                            decoration: InputDecoration(
                                hintText: "Type here country name",
                                hintStyle: TextStyle(
                                  fontSize: 16,),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    )
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(20),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 24,right: 16),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                )
                            )
                        ),
                        suggestionsCallback: (pattern){
                          return countryController.getSuggestions(snapshot.data, pattern);
                        },
                        itemBuilder: (context,suggestion){
                          return ListTile(
                            title: Text(suggestion.toString()),
                          );
                        },
                        transitionBuilder: (context,suggestionsBox, controller){
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (suggestion){
                          countryController.textAheadController.text = suggestion.toString();
                            countryController.summaryList.value = covidService.getCountrySummary(snapshot.data.firstWhere((element) => element.country == suggestion).slug);

                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Obx(
                      ()=> FutureBuilder(
                            future: countryController.summaryList.value,
                            builder: (context ,AsyncSnapshot snapshot) {
                              print("ERRRRRRRROR:${snapshot.error}");
                              if (snapshot.hasError)
                                return Center(child: Text("Error"),);
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Loading(inputTextLoading: false);
                                default:
                                  return snapshot.hasData != []?
                                  CountryStatics(summaryList: snapshot.data):
                                  Center(child: Text("Empty"),);
                              }
                            }),
                      )
                    ],
                  );
              }}),
      ),
    );;
  }
}







// class Country extends StatefulWidget {
//   const Country({Key? key}) : super(key: key);
//
//   @override
//   _CountryState createState() => _CountryState();
// }
//
// class _CountryState extends State<Country> {
//   final TextEditingController _textAheadController = TextEditingController();
//   late Future<List<CountryModel>> countryList;
//   late Future<List<CountrySummaryModel>> summaryList;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     countryList = covidService.getCountryList();
//     summaryList = covidService.getCountrySummary("Pakistan");
//      this._textAheadController.text = "Pakistan";
//   }
//
//   List<String> _getSuggestions(List<CountryModel> list, String query){
//      List<String> matches  = [];
//     for(var item in list){
//       matches.add(item.country);
//     }
//     matches.retainWhere((element) => element.toLowerCase().contains(query.toLowerCase()));
//     return matches;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: FutureBuilder(
//           future: countryList,
//           builder:(context,AsyncSnapshot   snapshot){
//             if(snapshot.hasError)
//               return Center(child: Text("Error"),);
//             switch(snapshot.connectionState){
//               case ConnectionState.waiting:
//                 return Loading(inputTextLoading: true);
//               default:
//                 return !snapshot.hasData?
//                     Center(child: Text("Empty"),):
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
//                           child: Text(
//                             "Type the country name",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                         TypeAheadFormField(
//                           textFieldConfiguration: TextFieldConfiguration(
//                             controller: _textAheadController,
//                             decoration: InputDecoration(
//                               hintText: "Type here country name",
//                               hintStyle: TextStyle(
//                                 fontSize: 16,),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                                 borderSide: BorderSide(
//                                   width: 0,
//                                   style: BorderStyle.none,
//                                 )
//                               ),
//                               filled: true,
//                               fillColor: Colors.grey[200],
//                               contentPadding: EdgeInsets.all(20),
//                               prefixIcon: Padding(
//                                 padding: EdgeInsets.only(left: 24,right: 16),
//                                 child: Icon(
//                                   Icons.search,
//                                   color: Colors.black,
//                                   size: 28,
//                                 ),
//                               )
//                             )
//                           ),
//                             suggestionsCallback: (pattern){
//                             return _getSuggestions(snapshot.data, pattern);
//                         },
//                           itemBuilder: (context,suggestion){
//                             return ListTile(
//                               title: Text(suggestion.toString()),
//                             );
//                           },
//                           transitionBuilder: (context,suggestionsBox, controller){
//                             return suggestionsBox;
//                           },
//                           onSuggestionSelected: (suggestion){
//                             this._textAheadController.text = suggestion.toString();
//                             setState(() {
//                               summaryList = covidService.getCountrySummary(snapshot.data.firstWhere((element) => element.country == suggestion).slug);
//                             });
//                           },
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         FutureBuilder(
//                           future: summaryList,
//                           builder: (context ,AsyncSnapshot snapshot) {
//                             print("ERRRRRRRROR:${snapshot.error}");
//                             if (snapshot.hasError)
//                               return Center(child: Text("Error"),);
//                             switch (snapshot.connectionState) {
//                               case ConnectionState.waiting:
//                                 return Loading(inputTextLoading: false);
//                               default:
//                                 return snapshot.hasData != []?
//                                 CountryStatics(summaryList: snapshot.data):
//                                 Center(child: Text("Empty"),);
//                             }
//                           })
//                       ],
//                     );
//           }}),
//     );
//   }
// }
