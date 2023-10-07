import 'package:flutter/material.dart';
import 'package:flutter_map_arcgis_example/Image_Paths.dart';
import 'package:flutter_map_arcgis_example/controllers/report_ctrl.dart';
import 'package:get/get.dart';

class ReportingScreen extends StatelessWidget{
  const ReportingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportController reportController = Get.find();
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
                      onTap: (){
                        Get.defaultDialog(title: "Report Details",content: 
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  "Type",
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                alignment: Alignment.topCenter,
                                height: 40,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: DropdownButton<String>(
                                   value: reportController.fireReportChoice.value,
                                   hint: Text("Choose Report Type"),
                                   onChanged: (String? newValue) {
                                    reportController.fireReportChoice.value = newValue ?? reportController.fireReportChoice.value;
                                    Get.back();
                                    Get.defaultDialog(title: "Report sucessfull", middleText: "Sucessfully Reported " + (newValue ?? ""));
                                   },
                                   items: reportController.reportFirechoices.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );}).toList(),
                              ),
                              ),
                            ],
                          ),
                        ],
                                 ));
                                },
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
                              onTap: (){ Get.defaultDialog(title: "Report Details",content: 
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  "Type",
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                alignment: Alignment.topCenter,
                                height: 40,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: DropdownButton<String>(
                                   value: reportController.injuryReportChoice.value,
                                   hint: Text("Choose Report Type"),
                                   onChanged: (String? newValue) {
                                    Get.back();
                                    Get.defaultDialog(title: "Report sucessfull", middleText: "Sucessfully Reported " + (newValue ?? ""));
                                   },
                                   items: reportController.reportInjuryChoices.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );}).toList(),
                              ),
                              ),
                            ],
                          ),
                        ],
                                 ));},

                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Report Human Status"),
                                    //Image here
                                    Image.asset(ImagePaths.redCrossIcon)
                                  ],
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap: (){Get.defaultDialog(title: "Report Details",content: 
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  "Type",
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                alignment: Alignment.topCenter,
                                height: 40,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: DropdownButton<String>(
                                   value: reportController.roadBlockReportChoice.value,
                                   hint: Text("Choose Report Type"),
                                   onChanged: (String? newValue) {
                                    Get.back();
                                    Get.defaultDialog(title: "Report sucessfull", middleText: "Sucessfully Reported " + (newValue ?? ""));
                                   },
                                   items: reportController.reportRoadBlockChoices.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );}).toList(),
                              ),
                              ),
                            ],
                          ),
                        ],
                                 ));},

                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Report Road blocks"),
                                    //Image here
                                    Image.asset(ImagePaths.roadBlockIcon)
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){Get.defaultDialog(title: "Report Details",content: 
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  "Type",
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                alignment: Alignment.topCenter,
                                height: 40,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: DropdownButton<String>(
                                   value: reportController.enviromentalChoice.value,
                                   hint: Text("Choose Report Type"),
                                   onChanged: (String? newValue) {
                                    Get.back();
                                    Get.defaultDialog(title: "Report sucessfull", middleText: "Sucessfully Reported " + (newValue ?? ""));
                                   },
                                   items: reportController.reportEnviromentalChoices.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );}).toList(),
                              ),
                              ),
                            ],
                          ),
                        ],
                                 ));},
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Report enviromental hazards"),
                                    //Image here
                                    Image.asset(ImagePaths.enviromentalHazedIcon)
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){Get.defaultDialog(title: "Report Details",content: 
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  "Type",
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                alignment: Alignment.topCenter,
                                height: 40,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: DropdownButton<String>(
                                   value: reportController.volunteerChoice.value,
                                   hint: Text("Choose Report Type"),
                                   onChanged: (String? newValue) {
                                    Get.back();
                                    Get.defaultDialog(title: "Report sucessfull", middleText: "Sucessfully Updated Volunteer Status To " + (newValue ?? ""));
                                   },
                                   items: reportController.reportVolunteeringChoices.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );}).toList(),
                              ),
                              ),
                            ],
                          ),
                        ],
                                 ));},
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Volunteer"),
                                    //Image here
                                    Image.asset(ImagePaths.volunteerIcon)
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