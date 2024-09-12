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
        body: Stack(
          children: [
             Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePaths.appIcon),
                fit: BoxFit.cover,
                opacity: 0.2
              ),
            ),
          ),
            SingleChildScrollView(
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
                                      reportController.reportedFire.value = true;
                                      reportController.updateMarkers();
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
                                  decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepOrange,
                width: 10,  // Adjust the width for a thicker or thinner border
              ),
              borderRadius: BorderRadius.circular(25), // This gives the smooth edges
            ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Report Fire or Smoke" ,style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,

  ),),
                                      //Image here
                                      Image.asset(ImagePaths.fireIcon)
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                      padding: EdgeInsets.only(bottom: 20),
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
                                      reportController.reportedInjury.value = true;
                                      reportController.updateMarkers();
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
                                  decoration: BoxDecoration(
              border: Border.all(
                color: Colors.pink,
                width: 10,  // Adjust the width for a thicker or thinner border
              ),
              borderRadius: BorderRadius.circular(25), // This gives the smooth edges
            ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Report Human Status", style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,

  )),
                                      //Image here
                                      Image.asset(ImagePaths.redCrossIcon)
                                    ],
                                  ),
                                ),
                              ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
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
                                      reportController.reportedBlock.value = true;
                                      reportController.updateMarkers();
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
                                  decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 10,  // Adjust the width for a thicker or thinner border
              ),
              borderRadius: BorderRadius.circular(25), // This gives the smooth edges
            ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Report Road blocks" , style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,

  ),),
                                      //Image here
                                      Image.asset(ImagePaths.roadBlockIcon)
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                      padding: EdgeInsets.only(bottom: 20),
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
                                      reportController.reportedEnviromental.value = true;
                                      reportController.updateMarkers();
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
                                  decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                width: 10,  // Adjust the width for a thicker or thinner border
              ),
              borderRadius: BorderRadius.circular(25), // This gives the smooth edges
            ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Report enviromental hazards", style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,

  ),
),
                                      //Image here
                                      Image.asset(ImagePaths.enviromentalHazedIcon)
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                      padding: EdgeInsets.only(bottom: 20),
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
                                      reportController.reportedVolunteer.value = true;
                                      reportController.updateMarkers();
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
                                  decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 10,  // Adjust the width for a thicker or thinner border
              ),
              borderRadius: BorderRadius.circular(25), // This gives the smooth edges
            ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Volunteer" , style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,

  ),),
                                      //Image here
                                      Image.asset(ImagePaths.volunteerIcon)
                                    ],
                                  ),
                                ),
                              )
                  ],
            ),
          ),
          ]
        ),
      ),
    );
  }


}