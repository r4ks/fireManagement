import 'package:flutter/material.dart';
import 'package:get/get.dart';

class reportingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: 
      
      Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Container(
                  width: 100,
                  height: 100,
                  child: GestureDetector(
                    child: Image(image:),
                    onTap: () => Get.toNamed(page),
                  ),
                ),
              ),
            ],
          ),,
    )
  }


}