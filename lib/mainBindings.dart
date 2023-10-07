import 'package:flutter_map_arcgis_example/controllers/alarm_ctrl.dart';
import 'package:get/get.dart';

import 'controllers/map_ctrl.dart';
import 'utils/http_client.dart';

class MainBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AlarmController());
    Get.put(AirMapController());
    Get.put(ClientHttp());
  }


}