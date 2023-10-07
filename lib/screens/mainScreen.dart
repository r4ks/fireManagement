import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_arcgis_example/controllers/alarm_ctrl.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import '../Routes.dart';
import '../api/fire_management_api.dart';
import '../controllers/map_ctrl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final map = Get.find<AirMapController>();
  
  final spots = <Marker>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getViirData();
  }


      getViirData() async {
                    final data = await FireManagementApi().getViirData();
                    spots.addAll(data.map((i) =>
                      Marker(
                        point: LatLng(i.latitude, i.longitude),
                        width: 80,
                        height: 80,
                        builder: (context) => Icon(Icons.fire_extinguisher),
                      )));
      }

  List<Marker> createMarkersFromVIIRData() {
    return spots;
  }

  @override
  Widget build(BuildContext context) {

    AlarmController alarm_controller = Get.find<AlarmController>();
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text('ArcGIS')
    
          ),
          body: Obx((() => 
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  alarm_controller.isAlarm.value ?
                  Text("ALARM!!!"): 
                  SizedBox(), 
                  Flexible(
                    child:
                   FlutterMap(
                  options: MapOptions(
                    // center: LatLng(32.91081899999999, -92.734876),
                    // center: LatLng(35.611909, -82.440682),
                        center: LatLng(41.1075,37.32225),
                    zoom: 14.0,
                    plugins: [EsriPlugin()],

                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                      'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                      subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                    ),
                    // FeatureLayerOptions("https://services.arcgis.com/P3ePLMYs2RVChkJx/arcgis/rest/services/USA_Congressional_Districts/FeatureServer/0",
                    //   "polygon",
                    //   onTap: (dynamic attributes, LatLng location) {
                    //     print(attributes);
                    //   },
                    //   render: (dynamic attributes){
                    //     // You can render by attribute
                    //     return PolygonOptions(
                    //         borderColor: Colors.blueAccent,
                    //         color: Colors.black12,
                    //         borderStrokeWidth: 2
                    //     );
                    //   },
                    //
                    // ),
                    FeatureLayerOptions(
                      "https://services.arcgis.com/V6ZHFr6zdgNZuVG0/arcgis/rest/services/Landscape_Trees/FeatureServer/0",
                      "point",
                      render:(dynamic attributes){
                        // You can render by attribute
                        return PointOptions(
                          width: 30.0,
                          height: 30.0,
                          builder: const Icon(Icons.pin_drop),
                        );
                      },
                      onTap: (attributes, LatLng location) {
                        print(attributes);
                      },
                    ),
                              MarkerLayerOptions(
                  markers: createMarkersFromVIIRData(),
                ),
                    // FeatureLayerOptions(
                    //   "https://services.arcgis.com/V6ZHFr6zdgNZuVG0/ArcGIS/rest/services/Denver_Streets_Centerline/FeatureServer/0",
                    //   "polyline",
                    //   render:(dynamic attributes){
                    //     // You can render by attribute
                    //     return PolygonLineOptions(
                    //         borderColor: Colors.red,
                    //         color: Colors.red,
                    //         borderStrokeWidth: 2
                    //     );
                    //   },
                    //   onTap: (attributes, LatLng location) {
                    //     print(attributes);
                    //   },
                    // ),

                  ],
                ) 
                  ),
                  TextButton(onPressed: () =>Get.toNamed(Routes.reportingScreen), child: Text("Report")),
                ],
              ),
             )
            ),
          ),
        ),
    );
  }
}