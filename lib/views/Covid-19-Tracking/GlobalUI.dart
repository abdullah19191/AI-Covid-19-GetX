import 'package:flutter/material.dart';
import '../../model/cases_module.dart';

class GlobalUIState extends StatelessWidget {

final GlobalCases result;
GlobalUIState({required this.result});
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      buildCard(
          'CONFIRMED',
          result.totalConfirmed,
          result.newConfirmed,
          Colors.white70
      ),
      buildCard(
          'ACTIVE',
          result.totalConfirmed - result.totalDeaths - result.newConfirmed,
          result.newConfirmed - result.newDeaths,
          Colors.white70
      ),
      buildCard(
          'Recovered',
          result.totalRecovered,
          result.newRecovered,
          Colors.white70
      ),
      buildCard(
          'DEATHS',
          result.totalDeaths,
          result.newDeaths,
          Colors.white70
      ),
    ],
    );
  }
  Widget buildCard(String title , int? totalCount, int todayCount , Color color ){
    return Card(
     color: Colors.blue.shade100,
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
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
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 18,vertical: 9),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            Expanded(
              child: Container()
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: color,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      totalCount.toString(),
                      style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                          color: color,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      todayCount.toString(),
                      style: TextStyle(
                          color: color,
                          fontSize: 17.5,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
