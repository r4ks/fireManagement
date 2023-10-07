import 'package:flutter/material.dart';
import 'package:flutter_map_arcgis_example/Image_Paths.dart';
import 'package:get/get.dart';

class ReportingScreen extends StatelessWidget{
  const ReportingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
                mainAxisSize: MainAxisSize.max,          
                              mainAxisAlignment: MainAxisAlignment.center,
        
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
             
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Report Fire or Smoke"),
                                    //Image here
                                    Image.asset(ImagePaths.fireIcon)
                                  ],
                                ),
                              ),
                            ),
                GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Report Injury"),
                                    //Image here
                                    Image.asset(ImagePaths.fireIcon)
                                  ],
                                ),
                              ),
                            ),

                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Report Road blocks"),
                                    //Image here
                                    Image.asset(ImagePaths.fireIcon)
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Report enviromental hazards"),
                                    //Image here
                                    Image.asset(ImagePaths.fireIcon)
                                  ],
                                ),
                              ),
                            )
                ],
          ),
        ),
      ),
    );
  }


}