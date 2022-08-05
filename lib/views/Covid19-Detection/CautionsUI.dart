import 'package:flutter/material.dart';

import 'covid19detectUI.dart';

class CautionUI extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
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
                Column(
                  children: [
                    Container(
                      width: 300,
                      child: Row(
                        children: [
                          Icon(Icons.details,size: 22,color: Colors.white,),
                          SizedBox(width: 17),
                          Text('The signs and symptoms of \nPneumonia may include:',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Column(
                          children: [
                            Text('* Cough, which may produce greenish,\n    yellow or even bloody mucus' ,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,),),
                            SizedBox(
                              height: 10,
                            ),
                            Text('* Fever, sweating and shaking chills      ' ,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,),),
                            SizedBox(
                              height: 10,
                            ),
                            Text('* Shortness of breath and Rapid            \n   shallow breathing' ,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,),),
                            SizedBox(
                              height: 10,
                            ),
                            Text('   * Sharp or stabbing chest pain that gets  \n      worse when you breathe ' ,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,),),
                            SizedBox(
                              height: 10,
                            ),
                            Text('    * Loss of appetite, low energy, and fatigue' ,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,),),
                            SizedBox(
                              height: 10,
                            ),
                            Text('* Loss of taste or smell and loss of        \n  speech or mobility' ,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500,),),
                          ],
                        ),
                    ]),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 160,
                  width: 310,
                  //   color: Colors.teal,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.done,size: 26,color: Colors.white,),
                          SizedBox(width: 17),
                          Text('Make sure to capture picture \nclearly just like below:',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/xray.jfif')
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Do You Have The Above Symptoms?',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      minWidth: 20,
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {
                        Navigator.of(context).push(_createRoute());
                        // controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                      },
                      splashColor: Colors.black,
                      child: Text(
                        "YES",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue.shade700, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton(
                      minWidth: 20,
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                          title: const Text('Congratulations'),
                          content: const Text('As You Do Not Have Above Symptoms Mentioned,Hence You Do Not Require Covid Tests'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ));

                        // controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                      },
                      splashColor: Colors.black,
                      child: Text(
                        " NO ",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue.shade700, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}


Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 2000),
    pageBuilder: (context, animation, secondaryAnimation) => const Covid19TestUI(),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.ease, parent: animation);
      return FadeTransition(
        opacity:animation,
        child: child,
      );
    },
  );
}

