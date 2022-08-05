import 'dart:convert';
import 'package:mask_app/model/countrymodel.dart';
import 'package:http/http.dart' as http;
import 'model/cases_module.dart';
import 'model/countrylistmodel.dart';


class CovidService{

  Future<GlobalCases> getGlobalCases()  async{

    http.Response response;
    response = await http.get(Uri.parse('https://api.covid19api.com/summary'),);

    print(response.body);
    if(response.statusCode!=200) throw Exception();

    final summary = GlobalCases.fromJson(jsonDecode(response.body));

    return summary;
  }


  Future<List<CountryModel>> getCountryList()  async{

    http.Response response;
    response = await http.get(Uri.parse('https://api.covid19api.com/countries'),);

    print(response.body);
    if(response.statusCode!=200) throw Exception();

    List<CountryModel> countries = (json.decode(response.body) as List).map((item) => new CountryModel.fromJson(item)).toList();
    print("COUNTRYYYYYYYYY1: $countries");
    return countries;
  }

  Future<List<CountrySummaryModel>> getCountrySummary(String slug) async{
    http.Response response;
    response = await http.get(Uri.parse('https://api.covid19api.com/total/dayone/country/' + slug),);
    print("@@@@@@@@@${response.body}");

    if(response.statusCode != 200)
      throw Exception();
    if(response.body.isEmpty){
      throw   Exception();
    }
    List<CountrySummaryModel> summaryList = (json.decode(response.body) as List).map((item) => new CountrySummaryModel.fromJson(item)).toList();

    return summaryList;
  }

}

























// String accessToken = '20a4d4f66babbacd1afe8e68c1473363c5371a47433f520549147266ccfe1c03';
//
// Future<List<Cases>> getCovidCases()  async{
//
//   http.Response response;
//   response = await http.get(Uri.parse('https://ncov2019-admin.firebaseapp.com/cases?'),
//    headers: {
//      'Content-Type': 'application/json',
//      'Authorization': 'Bearer $accessToken'}
//   );
//   // print(response.body);
//   // print(response.statusCode);
//   // print(response.headers);
//   // print(response.contentLength);
//   print(response.body);
//   if(response.statusCode!=200)
//     throw Exception();
//
//
//  List<Cases> summaryList = (json.decode(response.body) as List).map((item) => new Cases.fromJson(item)).toList();
//   //final data = json.decode(response.body);
//
//   //final List<dynamic> data = json.decode(response.body);
//   return summaryList;
// }
//
// //DEATHS
// Future<List<Deaths>> getCovidDeaths()  async{
//
//   http.Response response;
//   response = await http.get(Uri.parse('https://ncov2019-admin.firebaseapp.com/deaths?'),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $accessToken'}
//   );
//   // print(response.body);
//   // print(response.statusCode);
//   // print(response.headers);
//   // print(response.contentLength);
//   print(response.body);
//   if(response.statusCode!=200)
//     throw Exception();
//
//
//   List<Deaths> summaryList = (json.decode(response.body) as List).map((item) => new Deaths.fromJson(item)).toList();
//   //final data = json.decode(response.body);
//
//   //final List<dynamic> data = json.decode(response.body);
//   return summaryList;
// }
//
// //RECOVERED
// Future<List<Recovered>> getRecoveredCases()  async{
//
//   http.Response response;
//   response = await http.get(Uri.parse('https://ncov2019-admin.firebaseapp.com/recovered'),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $accessToken'}
//   );
//   // print(response.body);
//   // print(response.statusCode);
//   // print(response.headers);
//   // print(response.contentLength);
//   print(response.body);
//   if(response.statusCode!=200)
//     throw Exception();
//
//
//   List<Recovered> summaryList = (json.decode(response.body) as List).map((item) => new Recovered.fromJson(item)).toList();
//   //final data = json.decode(response.body);
//
//   //final List<dynamic> data = json.decode(response.body);
//   return summaryList;
// }