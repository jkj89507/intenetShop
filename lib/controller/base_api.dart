import 'dart:convert';

import 'package:http/http.dart' as http;

class baseApi {
  // final String accessToken = 'vsRtpYX-sOHlOV-tljYEPSbqABF7Q5Xy';
  final String _baseApiUrl = "ostest.whitetigersoft.ru";
  final String _appKey =
      'phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF';

  // Future apiRequest(String urlPath, String method, [Map? data]) async {
  //   var response;
  //   switch (method.toUpperCase()) {
  //     case "GET": {
  //       try {
  //         response = await http.get(Uri.parse(urlPath), headers: {
  //           "Access-Control-Allow-Origin": "*" // Required for CORS support to work
  //         });
  //       } catch (e){
  //         print("apiRequestsGET: ${e.toString()}");
  //       }
  //       break;
  //     }
  //     case "POST": {
  //       try {
  //         response = await http.post(Uri.parse(urlPath), body: data, headers: {
  //           "Access-Control-Allow-Origin": "*"
  //         });
  //       } catch (e) {
  //         print("apiRequestsPOST: ${e.toString()}");
  //       }
  //       break;
  //     }
  //   }
  //   return json.decode(response.body);
  //   // print('Response status: ${response.statusCode}');
  //   // print('Response body: ${response.body}');
  // }
  Future sendGetRequest({ required String endPoint,
                        Map<String,
                        dynamic>? params,}) async {
    var urlParams = <String, dynamic>{
      "appKey": _appKey,
    };
    if (params?.isNotEmpty ?? false) {
      urlParams.addAll(params!);
    }

    // https://api.dart.dev/stable/2.16.1/dart-core/Uri-class.html
    var uri = Uri(
      scheme: 'http',
      host: _baseApiUrl,
      path: endPoint,
      queryParameters: urlParams,
    );
    try {
      var response = await http.get(uri, headers: {
        "Access-Control-Allow-Origin": "*"
        // Required for CORS support to work
      });
      return json.decode(response.body);
    } catch (e) {
      print("apiRequestsGET: ${e.toString()}");
    }
  }

  Future sendPostRequest({ required String endPoint,
    Map<String,
        String>? params,}) async {
    var urlParams = <String, dynamic>{
      "appKey": _appKey,
    };
    if (params?.isNotEmpty ?? false) {
      urlParams.addAll(params!);
    }
    var uri = Uri(
      scheme: 'http',
      host: _baseApiUrl,
      path: endPoint,
      queryParameters: urlParams,
    );
    try {
      var response = await http.get(uri, headers: {
        "Access-Control-Allow-Origin": "*"
        // Required for CORS support to work
      });
      return json.decode(response.body);
    } catch (e) {
      print("apiRequestsGET: ${e.toString()}");
    }
  }
}