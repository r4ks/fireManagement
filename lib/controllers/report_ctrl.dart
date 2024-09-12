import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_arcgis_example/Image_Paths.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class ReportController extends GetxController{
    final List<String> reportFirechoices = ["Wild Fire", "Civil Fire", "Smoke", "Arson"];
    final List<String> reportInjuryChoices = ["Lightly Injured","Heavily Injured", "Lost", "Death", "Needs Rescue"];
    final List<String> reportRoadBlockChoices = ["Closed","Difficult", "On Fire", "Traffic Jam"];
    final List<String> reportEnviromentalChoices = ["Flammable Object","Water Contaminant", "Rare species in danger", "Damaged Structure"];
    final List<String> reportVolunteeringChoices = ["Not Volunteering","General","Transportation", "Medical", "Communication"];

    RxBool reportedFire = false.obs;
    RxBool reportedInjury = false.obs;
    RxBool reportedBlock = false.obs;
    RxBool reportedEnviromental = false.obs;
    RxBool reportedVolunteer = false.obs;
    
    RxString fireReportChoice = "Wild Fire".obs;
    RxString injuryReportChoice = "Lightly Injured".obs;
    RxString roadBlockReportChoice = "Closed".obs;
    RxString enviromentalChoice = "Flammable Object".obs;
    RxString volunteerChoice = "Not Volunteering".obs;

    void updateMarkers(){
      bisherMarkers.clear();
      bisherMarkers.add(Marker(
        point: LatLng(37.08089575554106, 35.35752840453171),
        width: 80,
        height: 80,
        builder: (context) => Image.asset(ImagePaths.shelterIcon)));

      if(reportedFire.value){
        bisherMarkers.add( Marker(
        point: LatLng(37.07916541977954,35.369805781605216),
        width: 80,
        height: 80,
        builder: (context) => Image.asset(ImagePaths.fireIcon)));
      }
        if(reportedInjury.value){
          bisherMarkers.add(Marker(
        point: LatLng(37.07934905133998, 35.36788144331063),
        width: 80,
        height: 80,
        builder: (context) => Image.asset(ImagePaths.redCrossIcon)));
        }
        if(reportedBlock.value){
          bisherMarkers.add(Marker(
        point: LatLng(37.07701114175803, 35.3686851080358),
        width: 80,
        height: 80,
        builder: (context) => Image.asset(ImagePaths.roadBlockIcon)));
        }
        if(reportedEnviromental.value){
        bisherMarkers.add(Marker(
        point: LatLng(37.07578496886838, 35.369971129894154),
        width: 80,
        height: 80,
        builder: (context) => Image.asset(ImagePaths.enviromentalHazedIcon)));
        }
        if(reportedVolunteer.value){
          Marker(
        point: LatLng(37.07853877879312, 35.36404575191596),
        width: 80,
        height: 80,
        builder: (context) => Image.asset(ImagePaths.volunteerIcon));
        }
    }

    var bisherMarkers = <Marker>[    
      Marker(
        point: LatLng(37.08089575554106, 35.35752840453171),
        width: 80,
        height: 80,
        builder: (context) => Image.asset(ImagePaths.shelterIcon)),     
    ].obs;


} 