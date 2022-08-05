import 'package:flutter/material.dart';
import 'package:mask_app/views/Covid19-Detection/CautionsUI.dart';


class DiscriptionUI extends StatelessWidget {
  const DiscriptionUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Container(
          height: MediaQuery.of(context).size.height*0.95,
          width: MediaQuery.of(context).size.height*0.52,
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
              )),
        //  padding: const EdgeInsets.only(bottom: 180,left: 20,top: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
                width: 20,
              ),
              Container(
           //     color: Colors.black,
                height: 230,
                width: 310,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.phone_android,size: 26,color: Colors.white,),
                        SizedBox(width: 17),
                        Text('Summary',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 25),
                      child: Text('After the covid 19 epidemic which affected the whole world,many new concepts entered in our daily lives.Covid-19 ,which started to grow with trio of mask,distance  and hygiene incorporated concepts such as pneumonia in the following periods.The aim of this application is to obtain  a Tenserflow Lite output with Google Products based on the data set  containing lung X-Rays and develop Mobile Application ' ,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w700,),),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                width: 310,
             //   color: Colors.teal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.animation,size: 26,color: Colors.white,),
                        SizedBox(width: 17),
                        Text('What is Pneumonia?',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 25),
                      child: Text('Pneumonia is an infection that inflames your lungs air sacs (alveoli). The air sacs may fill up with fluid or pus, causing symptoms such as a cough, fever, chills and trouble breathing',textAlign: TextAlign.start ,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w700,),),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                width: 310,
                //   color: Colors.teal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info,size: 26,color: Colors.white,),
                        SizedBox(width: 17),
                        Text('Note',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 25),
                      child: Text('The result obtained from this application are not valid for medical diagnosis.The result must be checked in the presence of a specialist',textAlign: TextAlign.start ,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w700,),),
                    ),
                  ],
                ),
              ),
              FlatButton(
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                  // controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                splashColor: Colors.blue,
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    fontSize: 17,
                      color: Colors.blue.shade700, fontWeight: FontWeight.bold),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 2000),
    pageBuilder: (context, animation, secondaryAnimation) =>CautionUI(),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.ease, parent: animation);
      return FadeTransition(
        opacity:animation,
        child: child,
      );
      //
      // const begin = Offset(0.0, 1.0);
      // const end = Offset.zero;
      // const curve = Curves.ease;
      //
      // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      // return SlideTransition(
      //   position: animation.drive(tween),
      //   child: child,
      // );
    },
  );
}