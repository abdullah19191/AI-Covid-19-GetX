import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'Prediction.dart';

late bool loading = true;


class Covid19TestUI extends StatefulWidget {
  const Covid19TestUI({Key? key}) : super(key: key);

  @override
  _Covid19TestUIState createState() => _Covid19TestUIState();
}

class _Covid19TestUIState extends State<Covid19TestUI> {
  List _prediction = [];
 late File _image;
  final imagepicker = ImagePicker();
  List Predictions = [];

  void initState() {
    super.initState();
    loadmodel();
    // DetectImage(_image).whenComplete(() {
    //   setState(() {});
    // });
  //  _image = File(_image.path);
  }
  //
  void dispose(){
    super.dispose();
   // DetectImage(_image);
   //  loadmodel();
  }

  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/model1_unquant.tflite', labels: 'assets/labels1.txt');
  }

  DetectImage(File image) async {
    var predictions = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.4,
        imageStd: 127.5,
        imageMean: 127.5);
   // if(mounted){
    setState(() {
      loading = false;
      _prediction = predictions!;
    });

  }

  _Loadimage_Gallery() async {
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }

    DetectImage(_image);
  }

  Loadimage_Camera() async {
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    // PredictionUI().method(_image);
    DetectImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    tileMode: TileMode.clamp,
    colors: <Color>[
    Color(0xff0a0fc9),
    //Colors.white,
    Color(0xff3bd2d6)
    ])
            ),),
            title: Text('Upload An Image'),
            leading: Icon(Icons.arrow_back_outlined),
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        floatingActionButton: SpeedDial(
          backgroundColor: Color(0xff0a0fc9),
          icon: Icons.photo_camera,
          activeIcon: Icons.menu,
          overlayColor: Colors.black54,
          overlayOpacity: 0.6,
          spacing: 12,
          spaceBetweenChildren: 12,
          children: [
            SpeedDialChild(
                child: Icon(
                  Icons.image,
                  color: Colors.white,
                ),
                label: 'Pick From Gallery',
                backgroundColor: Color(0xff0a0fc9),
                labelBackgroundColor: Color(0xff0a0fc9),
                labelStyle: TextStyle(color: Colors.white),
                onTap: () {
                  _Loadimage_Gallery();
                }),
            SpeedDialChild(
                child: Icon(Icons.camera, color: Colors.white),
                backgroundColor: Color(0xff0a0fc9),
                label: 'Use Camera',
                labelStyle: TextStyle(color: Colors.white),
                labelBackgroundColor: Color(0xff0a0fc9),
                onTap: () {
                  Loadimage_Camera();
                }),
          ],
        ),
        body: Column(children: [
          loading == false
              ? Column(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 46, vertical: 30),
                        child: Container(
                          height: 370,
                          width: 400,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.file(_image),
                          ),
                        )),
                    Text(
                      'Tap On Show Results And Wait For Few Seconds While We Process Your X-Ray',
                      style: TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PredictionUI(_prediction)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff0a0fc9),
                        fixedSize: Size(130, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      child: Text(
                        'Show Result',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Provide A Clear Picture Of Chest Or Lungs X-Ray',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
        ]));
  }
}
