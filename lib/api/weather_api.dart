
import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:flutter_map_arcgis_example/models/wind_direction.dart';
import 'package:http/http.dart' as http;

import '../models/viirs.dart';
import '../models/wind_speed.dart';

const windspeedunit = '&windspeed_unit=';

final client = http.Client();
class WeatherApi {

// get whether wind data
// valid minutes values are windspeed_10m, windspeed_80m, windspeed_120m, windspeed_180m
// from https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m
Future<Iterable<WindSpeed>> getWindSpeedData({latitude = 0.0, longitude = 0.0, minutes = 10}) async {
    var response = await client.post(Uri.https('api.open-meteo.com', 'v1/forecast?latitude=$latitude&longitude=$longitude&hourly=windspeed_${minutes}m'), body: {});
    List<dynamic> windspeeds = json.decode(response.body);
    return windspeeds.map((e) => WindSpeed.fromJson(e));
  }

  // get whether's wind direction data
  // valid minutes values are 10m, 80m, 120m, 180m
  // from https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m
  Future<Iterable<WindDirection>> getWindDirectionData({latitude = 0.0, longitude = 0.0, minutes = 10}) async {
    var response = await client.post(Uri.https('api.open-meteo.com', 'v1/forecast?latitude=$latitude&longitude=$longitude&hourly=winddirection_${minutes}m'), body: {});
    List<dynamic> directions = json.decode(response.body);
    return directions.map((e) => WindDirection.fromJson(e));
  }
}