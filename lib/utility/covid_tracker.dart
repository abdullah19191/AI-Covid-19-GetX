import 'package:flutter/material.dart';
import '../views/Covid-19-Tracking/Country.dart';
import '../views/Covid-19-Tracking/Global.dart';
import '../views/Covid-19-Tracking/navigation.dart';

enum NavigationStatus { Global, Country }

class Tracker extends StatefulWidget {
  const Tracker({Key? key}) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  NavigationStatus navigationStatus = NavigationStatus.Global;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
     //   extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment(-1.0, 1.2),
                      tileMode: TileMode.clamp,
                      colors: <Color>[
                        Color(0xff0a0fc9),
                        Color(0xff3bd2d6),
                      ]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                )
            ),
            title: Text('GLOBAL COVID CASES', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
            backgroundColor: Colors.transparent,
          )) ,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(32),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45),
                      ),
              color: Colors.white,
                  ),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: navigationStatus == NavigationStatus.Global? GlobalScreen() : CountryScreen(),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment(-1.0, 1.2),
                  tileMode: TileMode.clamp,
                  colors: <Color>[
                    Color(0xff0a0fc9),
                    Color(0xff3bd2d6),
                  ]),
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
            height: size.height* 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigstionOption(
                    title: "Global",
                    selected: navigationStatus == NavigationStatus.Global,
                    onSelected: (){
                      setState(() {
                        navigationStatus = NavigationStatus.Global;
                      });
                    }),
                NavigstionOption(
                    title: "Country",
                    selected: navigationStatus == NavigationStatus.Country,
                    onSelected: (){
                      setState(() {
                        navigationStatus = NavigationStatus.Country;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
