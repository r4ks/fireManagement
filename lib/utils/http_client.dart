import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

import 'package:path/path.dart' as Path;

/// Server address
const isDebug = kDebugMode;
const theServer = 'firms.modaps.eosdis.nasa.gov';

///
/// http client.
/// *Please create only a single instance of this!
///
class ClientHttp {
  late HttpClient hc;
  late IOClient client;

  Future<Map<String, String>> getHeader() async {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $t',
      "Access-Control-Allow-Origin": "*",
      'Access-Control-Allow-Credentials': 'true',
      'Access-Control-Allow-Headers': 'Content-Type',
      "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    };
  }

  ClientHttp() {
    if (isDebug) {
      HttpOverrides.global = DevHttpOverrides();
    }

    client = IOClient(HttpClient(context: isDebug ? SecurityContext.defaultContext : null));
  }

  ///
  /// The Get Method
  ///
  Future<Response> Get(String uri) async {
    final url = Uri.https(theServer,uri);
    log("GET: $url");
    return await client.get(url, headers: await getHeader());
  }

  ///
  /// The Post
  ///
  Future<String> Post(String uri, {Object? body, Encoding? encoding}) async {
    final url = Uri.https(theServer,uri);
    log("POST: $url");
    final result = await client.post(url, headers: await getHeader(), body: jsonEncode(body), encoding: encoding);
    if (result.statusCode == 200) {
      return result.body;
    } else {
      throw HttpException("${result.statusCode}: ${result.reasonPhrase}");
    }
  }
}

///
/// This bypass the unsecure certificate for a specific host
/// Disable this on production mode.
///
class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
