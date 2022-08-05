import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool _loading = true;
  late File _image;
  final imagepicker = ImagePicker();
 // late List _predictions;

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }


  loadmodel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  detect_image(File image) async{
   var predictions =  await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.6,
      imageMean:  127.5,
      imageStd: 127.5
    );
   setState(() {
     //_predictions = predictions!;
     _loading = false;
   });
  }

  void dispose() {
    super.dispose();
  }

  image_gallery()async{
    var image = await imagepicker.getImage(source: ImageSource.gallery);
    if(image == null){
      return null;
    }else{
      _image = File(image.path);
    }
    detect_image(_image);
  }

  image_camera()async{
    var image = await imagepicker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    detect_image(_image);
  }


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mask App'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          //color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,width: 150,
             // color: Colors.tealAccent,
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/mask.png',)
              ),
              Container(
                child:Text(
                  'Mask App',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 80,
                padding: EdgeInsets.all(10),
                child: RaisedButton(onPressed: () {
                       image_camera();
                },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.teal,
                  child:Text(
                    'Camera',style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 80,
                padding: EdgeInsets.all(10),
                child: RaisedButton(onPressed: () {
                      image_gallery();
                },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.teal,
                  child:Text(
                    'Gallery',style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                  ),
                ),
              ),
              _loading != true?
              Container(
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        //width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: Image.file(_image),),
                      Container(
                      //  child: Text(_predictions[0]['label'].toString().substring(2)),
                      )
                    ],
                  )):Container(),
            ],
          ),
        ),
      ),
    );
  }
}
