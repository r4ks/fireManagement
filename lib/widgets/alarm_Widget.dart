import 'package:flutter/cupertino.dart';
import 'package:flutter_map_arcgis_example/Image_Paths.dart';
import 'package:flutter_map_arcgis_example/controllers/alarm_ctrl.dart';
import 'package:get/get.dart';

class AlarmWidget extends StatelessWidget{
  AlarmWidget(){
     alarmController = Get.find();
  }
  late AlarmController alarmController;

  @override
  Widget build(BuildContext context) {
      
    // TODO: implement build
    return SafeArea(
      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    alarmController.alarmText.value,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Image.asset(ImagePaths.alarmIcon),
                                ),]), ],),
    );
  }


}