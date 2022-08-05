// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_app/model/onboardingmodel.dart';
import 'package:mask_app/GetX-Controller/onboarding_controller.dart';




class OnboardScreen extends StatelessWidget {
  OnboardScreen({Key? key}) : super(key: key);
  final OnboardController   onboardController = Get.put(OnboardController());
  Widget pageIndicator(bool isCurrent) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      height: isCurrent ? 11.0 : 7.8,
      width: isCurrent ? 11.0 : 7.8,
      decoration: BoxDecoration(
        color: isCurrent ? Colors.white70 : Colors.white38,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 38.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 400,
          color: Color(0xffFFFFFF),
          child:PageView.builder(
            controller: onboardController.pageController,
                onPageChanged: (val) {
                  onboardController.currentIndex.value  = val;
                },
                itemCount: onboardController.slides.length,
                itemBuilder: (context, index) {
                  return Slider(
                    onboardController.slides[index].getAssertImage(),
                    onboardController.slides[index].getTTile(),
                    onboardController.slides[index].getsubTitle(),
                    onboardController.slides[index].getButton(),
                  );
                }),
        ),
      ),
      bottomSheet: Container(
          height: Platform.isAndroid ? 60 : 20,
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
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                onPressed: onboardController.forwardPage,
                splashColor: Colors.blue,
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              Obx( ()=> Container(
                    width: 220,
                    child: Row(
                      children: [
                        for (int i = 0; i < onboardController.slides.length; i++)
                          onboardController.currentIndex.value == i
                              ? pageIndicator(true)
                              : pageIndicator(false),
                      ],
                    )),
              )
            ],
          )),
    );
  }
}

class Slider extends StatelessWidget {
  String? imagepath, title, subtitle;
  Widget? button;

  Slider(this.imagepath, this.title, this.subtitle, this.button);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagepath.toString(),
            width: 220,
            height: 160,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            title.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
            ),
          ),
          SizedBox(height: 12),
          Text(
            subtitle.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.lightBlue,
            ),
          ),
          SizedBox(height: 12),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(seconds: 2),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      animation = CurvedAnimation(
                          parent: animation, curve: Curves.bounceOut);

                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, animationTime) {
                      return button as Widget;
                    },
                  ));
            },
            child: Text(
              "Lets Get Started",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            // highlightColor: Colors.white,
            splashColor: Colors.tealAccent, //Replace with actual colors
            color: Colors.lightBlue,
          ),
        ],
      ),
    );
  }
}





// PageRouteBuilder(
// transitionDuration: Duration(seconds: 2),
// transitionsBuilder: (context,animation,animationTime,child){
// animation = CurvedAnimation(parent: animation, curve:  Curves.slowMiddle);
// return ScaleTransition(
// scale: animation,
// child: child,
// alignment: Alignment.center,
// );
// },
// pageBuilder: (context,animation,animationTime) {
// return button as Widget;
// }, opaque: false)
