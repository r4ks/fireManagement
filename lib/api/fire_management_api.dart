import 'dart:convert';
import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../models/viirs.dart';
import '../utils/http_client.dart';

class FireManagementApi {
final client = Get.find<ClientHttp>();

/// Get Viirs Satelites data
// https://firms.modaps.eosdis.nasa.gov/api/country/csv/5110d95cb1457ffe923b31aeb9f4ef29/VIIRS_NOAA20_NRT/TUR/10/2023-10-07
Future<Iterable<Viirs>> getViirData({String token = '5110d95cb1457ffe923b31aeb9f4ef29', String countryCode = 'TUR', timeRange = 10, date = '2023-10-07'}) async {
    var response = await client.Post('api/country/csv/$token/VIIRS_NOAA20_NRT/$countryCode/$timeRange/$date', body: {});
    const ls = LineSplitter();
    List<String> ln = ls.convert(response);
    final headers = ln[0].split(',');
    final map = ln.sublist(1).map((e) => Map<String, dynamic>.fromIterables(headers, e.split(',')));
    return ViirsFromJson(map);
  }
}