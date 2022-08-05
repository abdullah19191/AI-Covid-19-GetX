import 'package:flutter/cupertino.dart';
import 'package:mask_app/views/Covid19-Detection/PenumoniaSum.dart';
import 'package:mask_app/utility/covid_tracker.dart';

class SliderModel{
   String? imagePath;
   String? title;
   String? subtitle;
   Widget? button;
  SliderModel({this.imagePath,this.title,this.subtitle,this.button});

  //SliderModel(this.imagePath, this.title, this.subtitle);

  void setImagePath(String getImagePath){
    imagePath = getImagePath;
  }
  void setTitle(String getTitle){
    title = getTitle;
  }

  void setSubtitle(String getSubtitle){
    subtitle = getSubtitle;
  }
   void setButton(Widget getbutton){
     button = getbutton;
   }
  String? getAssertImage(){
    return imagePath;
  }
  String? getTTile(){
    return title;
  }
 String? getsubTitle(){
    return subtitle;
  }
   Widget? getButton(){
     return button;
   }
}

List<SliderModel> getSlides(){
 // String Imagepath,Title,subtitle;
  List<SliderModel> slides =  <SliderModel>[];
  SliderModel sliderModel = new SliderModel();


  sliderModel.setSubtitle("This Feature Will Give You Update Of Covid-19 Cases Global And Country Wise With Charts And Graphs");
  sliderModel.setTitle("Welcome To COVID-19 \nTracker");
  sliderModel.setImagePath("assets/covid19-pic.PNG");
  sliderModel.setButton(Tracker());
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setSubtitle("This Feature Will Find If There Are Signs Of Pneumonia Using X-Ray Images Of The Lungs Using AI Based On Lung X-Ray Data ");
  sliderModel.setTitle("Welcome To COVID-19 \nDetection");
  sliderModel.setImagePath("assets/lung-xray1.jpg");
  sliderModel.setButton(DiscriptionUI());
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  //3
  sliderModel.setSubtitle("Our veggie plan is filled with delicious seasonal vegetables, whole grains, beautiful cheeses and vegetarian proteins");
  sliderModel.setTitle("Steps For Prevention Of Covid-19");
  sliderModel.setImagePath("assets/previmg.PNG");
  slides.add(sliderModel);
  sliderModel = new SliderModel();
  return slides;
}