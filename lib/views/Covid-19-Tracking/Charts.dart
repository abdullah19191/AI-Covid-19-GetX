import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../model/timeseries.dart';


class Chart extends StatelessWidget {

  late final List<charts.Series<TimeSeriesCases,DateTime>> seriesaList;
  late final bool animate;
  Chart(this.seriesaList,{required this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesaList,
      animate: animate,
      domainAxis: charts.EndPointsTimeAxisSpec(),
    );
  }


}
