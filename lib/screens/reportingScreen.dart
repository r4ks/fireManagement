import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportingScreen extends StatelessWidget{
  const ReportingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Container(
                  width: 100,
                  height: 100,
                  child: GestureDetector(
                    child: Text("You are here!"),
                  ),
                ),
              ),
            ],
      ),
    );
  }


}