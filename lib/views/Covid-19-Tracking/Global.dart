import 'package:flutter/material.dart';
import 'package:mask_app/GetX-Controller/global_controller.dart';
import 'package:mask_app/views/Covid-19-Tracking/GlobalUI.dart';
import 'package:mask_app/model/cases_module.dart';
import 'package:mask_app/utility/loading.dart';
import '../../services.dart';
import 'package:get/get.dart';



class GlobalScreen extends StatelessWidget {
  GlobalScreen({Key? key}) : super(key: key);
  final GlobalController globalController = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Global Corona Virus Cases',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                width: 90,
              ),
              Icon(
                Icons.refresh,
                color: Colors.black87,
              )
            ],
          ),
          FutureBuilder(
              future: globalController.summary,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError)
                  return Center(
                    child: Text(
                      'ERROR',
                    ),
                  );
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Loading(inputTextLoading: false);
                  default:
                    return Column(
                      children: [
                        GlobalUIState(result: snapshot.data),
                      ],
                    );
                }
              },
            ),
        ],
      ),
    );
  }
}

