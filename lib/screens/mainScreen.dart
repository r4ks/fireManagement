import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_arcgis_example/controllers/alarm_ctrl.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:rxdart/rxdart.dart';
import '../Routes.dart';
import '../api/fire_management_api.dart';
import '../api/weather_api.dart';
import '../controllers/map_ctrl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final map = Get.find<AirMapController>();
  final wheatherApi = Get.find<WeatherApi>();
  final mapController = MapController();
  final spots = <Marker>[];
  StreamSubscription<MapEvent>? mapSub;

  @override
  void dispose() {
    mapSub?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // subscribe to map events
    mapSub = mapController.mapEventStream.debounceTime(Duration(seconds: 1)).listen((event) async {
      final result = await wheatherApi.getWindSpeedData(latitude: event.center.latitude, longitude: event.center.longitude);
      final result1 = await wheatherApi.getWindDirectionData(latitude: event.center.latitude, longitude: event.center.longitude);
      print(result);
    });

    // get wind speed and direction when map is ready
    mapController.onReady.then((value) async {
      final result = await wheatherApi.getWindSpeedData(latitude: mapController.center.latitude, longitude: mapController.center.longitude);
      final result1 = await wheatherApi.getWindDirectionData(latitude: mapController.center.latitude, longitude: mapController.center.longitude);
      print(result);
    });
  }



  getViirData() async {
    final data = await FireManagementApi().getViirData();
    spots.addAll(data.map((i) =>
      Marker(
        point: LatLng(i.latitude, i.longitude),
        width: 80,
        height: 80,
        builder: (context) => Container(
          color: Color.fromARGB(0, 256 ~/(i.brightTi4 - 273.15), 0, 0),
          height: i.scan,
          width: i.track,
          child: Icon(Icons.fireplace)),
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
                  mapController: mapController,
                  options: MapOptions(
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