import 'package:flutter_map_arcgis_example/controllers/alarm_ctrl.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AlarmController());
  }


}