import 'package:flutter/material.dart';
import 'package:mask_app/views/Covid19-Detection/covid19detectUI.dart';
import 'dart:math' as math;

class PredictionUI extends StatefulWidget {
  List _prediction = [];
  PredictionUI(this._prediction);

  @override
  _PredictionUIState createState() {
    return _PredictionUIState(this._prediction);
  }
}

class _PredictionUIState extends State<PredictionUI> with TickerProviderStateMixin{
  _PredictionUIState(this._prediction);
  late AnimationController _controller;
  late AnimationController controller;
  Animation<double>? _animation;

  List _prediction = [];


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        value: 0.0,
        duration: Duration(seconds: 14),
        upperBound: 1,
        lowerBound: -1,
        vsync: this)..repeat();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    )..forward();
    _animation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                    animation: _controller,
                    child: Container(
                height: size.height * 1,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      tileMode: TileMode.clamp,
                      colors: <Color>[
                        Color(0xff0a0fc9),
                        //Colors.white,
                        Color(0xff3bd2d6)
                      ]),
                )),
            builder: (BuildContext context, Widget? child)
                    {
                    return  ClipPath(
                        clipper: DrawClip(_controller.value),
                        child: child,
                      );

                    }),
                Positioned(
                  top: 86,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 60),
                    child: Column(
                      children: [
                        Text(
                          'YOUR COVID RESULT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                        Text(
                          'X-RAY',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Image.asset('assets/Covid-19-xra.png'),
                ),
                Positioned(
                  bottom: 118,
                  child: FadeTransition(
                    opacity: _animation!,
                    child: Container(
                        child: loading == false
                            ? Container(
                            child:Text(
                              (_prediction.isEmpty)
                                  ? "Sorry Could Not Detect"
                                  : _prediction[0]['label'].toString().substring(1),
                              style:TextStyle(
                                color: Colors.blue,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            )
                        )
                            : Text('NOTHING')),
                  ),
                )

              ],
            ),
          ],
        ));
  }
}

class DrawClip extends CustomClipper<Path>{
  double move = 0;
  DrawClip(this.move);
  double slice = math.pi;

  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0,size.height *0.7);
    double xCenter = size.width *0.4 + (size.width *0.6 + 1) *math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height*0.8);
    
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {

    return true;
  }
}

//
// Container(
// child: loading == false
// ? Container(
// child:Text(
// (_prediction.isEmpty)
// ? "Sorry Could Not Detect"
// : _prediction[0]['label']
// .toString()
//     .substring(1),
// )
// )
// : Text('NOTHING'))

//
// PreferredSize(
// preferredSize: Size.fromHeight(60.0),
// child: AppBar(
// centerTitle: true,
// flexibleSpace: Container(
// decoration: const BoxDecoration(
// gradient: LinearGradient(
// begin: const FractionalOffset(0.0, 0.0),
// end: const FractionalOffset(3, 0.0),
// tileMode: TileMode.clamp,
// colors: <Color>[
// Color(0xff0a0fc9),
// Colors.white,
// Color(0xff3bd2d6)
// ]),
// ),
// ),
// title: Text('Your Chest X-Ray Result'),
// leading: Icon(Icons.arrow_back_outlined),
// ),
// )