import 'dart:convert';

import 'package:http/http.dart' as http;

final client = http.Client();
class FireManagementApi {


// https://firms.modaps.eosdis.nasa.gov/api/country/csv/5110d95cb1457ffe923b31aeb9f4ef29/VIIRS_NOAA20_NRT/TUR/10/2023-10-07
getViirData({String token = '5110d95cb1457ffe923b31aeb9f4ef29', String countryCode = 'TUR', timeRange = 10, date = '2023-10-07'}) async {
  try {
    var response = await client.post(
        Uri.https('firms.modaps.eosdis.nasa.gov', 'api/country/csv/$token/VIIRS_NOAA20_NRT/$countryCode/$timeRange/$date'),
        body: {'name': 'doodle', 'color': 'blue'});
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var uri = Uri.parse(decodedResponse['uri'] as String);
    print(await client.get(uri));
    } finally {
      client.close();
    }
  }
}