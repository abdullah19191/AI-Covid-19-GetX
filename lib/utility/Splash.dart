import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_app/GetX-Controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (controller) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          tileMode: TileMode.clamp,
                          colors: <Color>[
                        // Colors.black,
                        Color(0xff0a0fc9),
                        Color(0xff3bd2d6),
                      ])),
                ),
                Positioned(
                  top: 180.0,
                  right: 62.0,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 70.0,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.add_circle_sharp,
                          size: 130.0,
                          color: Colors.white,
                        ),
                      ),
                      // Padding(padding: EdgeInsets.only(top:0.0)),
                      Text(
                        'COVID DIGNOSIS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text(
                        'Advanced Healthcare Made Personal',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w700
                            //fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}

// class Splash extends StatefulWidget {
//   const Splash({Key? key}) : super(key: key);
//
//   @override
//   _SplashState createState() => _SplashState();
// }
//
// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     Timer (
//         Duration(seconds: 10),
//             () => Navigator.pushReplacement(context, MaterialPageRoute(
//                 builder: (context) => OnboardingScreen()
//             )));
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     begin: Alignment.bottomLeft,
//                     end: Alignment.topRight,
//                     tileMode: TileMode.clamp,
//                     colors: <Color>[
//                      // Colors.black,
//                       Color(0xff0a0fc9),
//                       Color(0xff3bd2d6),
//                     ])
//             ),
//           ),
//           Positioned(
//             top: 180.0,
//             right: 62.0,
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 70.0,
//                   backgroundColor: Colors.transparent,
//                   child: Icon(
//                     Icons.add_circle_sharp,
//                     size: 130.0,
//                     color: Colors.white,
//                   ),
//                 ),
//                // Padding(padding: EdgeInsets.only(top:0.0)),
//                 Text(
//                   'COVID DIGNOSIS',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Padding(padding: EdgeInsets.only(top:10.0)),
//                 Text(
//                   'Advanced Healthcare Made Personal',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 13.0,
//                     fontWeight: FontWeight.w700
//                     //fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
