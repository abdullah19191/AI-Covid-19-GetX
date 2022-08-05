import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loading extends StatelessWidget {
  late final bool inputTextLoading;
  Loading({ required this.inputTextLoading});

  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         inputTextLoading ? loadingInputCard() : Container(),
         loadingCard(),
         loadingCard(),
         loadingCard(),
       ],
    ) ;
  }
  Widget loadingInputCard(){
    return  Card(
      elevation: 1,
      child: Container(
        height: 105,
        padding:  EdgeInsets.all(24),
        child: Shimmer.fromColors(
            baseColor:  Color(0xffDCDCDC),
            highlightColor: Color(0xffD3D3D3),
            child: Container(
              width: double.infinity,
              height: 57,
              color: Colors.white,
            ),
        ),
      ),
    );
  }
  Widget loadingCard(){
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Shimmer.fromColors(
            baseColor: Color(0xffDCDCDC),
            highlightColor: Color(0xffD3D3D3),
          child: Column(
            children: <Widget>[
              Container(
                width: 100,
                height: 20,
                color: Colors.white,
              ),
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                height: 15,
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 30,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
