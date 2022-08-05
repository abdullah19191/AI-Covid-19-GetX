//import 'dart:core';

class CovidSummary{
  int? cases;
  int? casesSuspected;
  int? casesConfirmed;
  int? deaths;
  int? recovered;

  CovidSummary(this.cases,this.casesSuspected,this.casesConfirmed,this.deaths,this.recovered);

  CovidSummary.fromJson(Map<int, dynamic> json) {
    cases = json['cases'].toString() as int?;
    casesSuspected = json['casesSuspected'].toString() as int?;
    casesConfirmed = json['casesConfirmed'].toString() as int?;
    deaths = json['deaths'].toString() as int?;
    recovered = json['recovered'].toString() as int?;
  }

  // Map<int, dynamic> toJson()  {
  //   final Map<int, dynamic> data = new Map<int, dynamic>();
  //   data["cases"] = this.cases.toString();
  //   data["casesSuspected"] = this.casesSuspected.toString();
  //   data["casesConfirmed"] = this.casesConfirmed;
  //   data["deaths"] = this.deaths;
  //   data["recovered"] = this.recovered;
  //
  //   return data;
  // }

}


