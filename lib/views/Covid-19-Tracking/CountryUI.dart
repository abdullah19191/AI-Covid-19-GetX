import 'package:flutter/material.dart';
import 'package:mask_app/model/countrylistmodel.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mask_app/model/timeseries.dart';
import 'package:mask_app/views/Covid-19-Tracking/Charts.dart';


class CountryStatics extends StatelessWidget {

  final List<CountrySummaryModel> summaryList;
  CountryStatics({required this.summaryList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          buildCard(
              "Confirmed",
              summaryList[summaryList.length - 1].confirmed,
            Colors.white70,
              "Active",
              summaryList[summaryList.length - 1].active,
            Colors.white70,
          ),
        buildCard(
          "Recovered",
          summaryList[summaryList.length -1].recovered,
          Colors.white70,
          "Death",
          summaryList[summaryList.length -1].death,
          Colors.white70,
        ),
        buildCardChart(summaryList),
      ],
    );
  }

  Widget buildCard(String leftTitle , int leftvalue, Color leftColor , String rightTitle , int rightValue , Color rightcolor){
    return Card(
      color: Colors.blue.shade100,
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Container(
        height: 100,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment(-1.0, 1.2),
                  tileMode: TileMode.clamp,
                  colors: <Color>[
                    Color(0xff0a0fc9),
                    Color(0xff3bd2d6),
                  ]),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(32.0),
                topRight: const Radius.circular(32.0),
                bottomRight: const Radius.circular(32.0),
                bottomLeft: const Radius.circular(32.0),
              )
          ),
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  leftTitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Total",
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  leftvalue.toString(),
                  style: TextStyle(
                    color: leftColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),

              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  rightTitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 19.5,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Total",
                  style: TextStyle(
                    color: rightcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  rightValue.toString(),
                  style: TextStyle(
                    color: rightcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

              ],
            )
          ],
        ),
      ),

    );
  }
  Widget buildCardChart(List<CountrySummaryModel> summaryList){
    return Card(
      color: Colors.blue.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),

      elevation: 1,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment(-1.0, 1.2),
                tileMode: TileMode.clamp,
                colors: <Color>[
                  Color(0xff0a0fc9),
                  Color(0xff3bd2d6),
                ]),
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(32.0),
              topRight: const Radius.circular(32.0),
              bottomRight: const Radius.circular(32.0),
              bottomLeft: const Radius.circular(32.0),
            )
        ),
        height: 190,
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Chart(
          createdata(summaryList, Colors.white70), animate: false,
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesCases,DateTime>> createdata(List<CountrySummaryModel> summaryList,Color color ){
    List<TimeSeriesCases> confiremdData = [];
    List<TimeSeriesCases> activeData = [];
    List<TimeSeriesCases> deadData = [];
    for(var item in summaryList){
      confiremdData.add(TimeSeriesCases(item.date, item.confirmed));
      activeData.add(TimeSeriesCases(item.date, item.active));
      deadData.add(TimeSeriesCases(item.date, item.death));
    }
    return [
      new charts.Series<TimeSeriesCases,DateTime>
        (
          id: 'Confirmed',
          data: confiremdData,
          domainFn: (TimeSeriesCases cases,_) => cases.time,
          measureFn: (TimeSeriesCases cases,_) => cases.cases,
          colorFn: (_, __)=> charts.ColorUtil.fromDartColor(Colors.purple.shade500),
      ),
      new charts.Series<TimeSeriesCases,DateTime>
        (
        id: 'Active',
        data: activeData,
        domainFn: (TimeSeriesCases cases,_) => cases.time,
        measureFn: (TimeSeriesCases cases,_) => cases.cases,
        colorFn: (_, __)=> charts.ColorUtil.fromDartColor(Colors.tealAccent),
      ),
      new charts.Series<TimeSeriesCases,DateTime>
        (
        id: 'Death',
        data: deadData,
        domainFn: (TimeSeriesCases cases,_) => cases.time,
        measureFn: (TimeSeriesCases cases,_) => cases.cases,
        colorFn: (_, __)=> charts.ColorUtil.fromDartColor(Colors.red.shade900),
      )

    ];
  }

}
