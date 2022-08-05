import 'package:flutter/material.dart';
import 'package:mask_app/views/Covid19-Detection/covid19detectUI.dart';

class WaveScreen extends StatefulWidget {
  const WaveScreen({Key? key}) : super(key: key);

  @override
  _WaveScreenState createState() => _WaveScreenState();
}

class _WaveScreenState extends State<WaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          color: Colors.black,
          child: TweenAnimationBuilder(
            tween: Tween(begin: 2.0,end: 1.0),
            duration: Duration(milliseconds: 3500),
            child: Covid19TestUI(),
            builder: (context,value,  child){
              return ShaderMask(
                shaderCallback: (rect){
                  return RadialGradient(colors: [Colors.white,Colors.white,Colors.transparent,Colors.transparent],
                   stops: [0.0,0.55,0.6,1.0],
                    center: FractionalOffset(0.5,0.75),
                    radius: 1.5
                    //radius: value * 3
                  ).createShader(rect);
                },child: child,
              );
            },
        )),
      ),
    );
  }
}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 1500),
                  builder: (context, value, child) {
                    return ShaderMask(
                      blendMode:BlendMode.modulate,
                        shaderCallback: (rect) {
                          return RadialGradient(
                              radius: 3.1,
                              colors: [Colors.white, Colors.white, Colors.transparent, Colors.transparent], stops: [0.0, 0.55, 0.6, 1.0], center: FractionalOffset(0.95, 0.95))
                              .createShader(rect);
                        },
                        child: Covid19TestUI());
                  }),
            );
          },
        ));
  }
}