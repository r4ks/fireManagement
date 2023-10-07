import 'package:flutter_map_arcgis_example/controllers/alarm_ctrl.dart';
import 'package:get/get.dart';

import 'controllers/map_ctrl.dart';

class MainBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AlarmController());
    Get.put(AirMapController());
  }


}