import 'dart:convert';
import 'package:http/http.dart' as http;

const String accessToken = 'vsRtpYX-sOHlOV-tljYEPSbqABF7Q5Xy';
const String AppKey =
    'phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF';
const String questOffer =
    'http://ostest.whitetigersoft.ru/api/common/Categories/list';

const String authSendCode =
    'http://ostest.whitetigersoft.ru/api/common/auth/send-sms';
Map authSendCodeParams = {"phone": "89021007014"};

const String authRegistration =
    'http://ostest.whitetigersoft.ru/api/common/auth/login-by-phone';



class baseApi {
  String totalQuestWithApiKey(String urlPath) {
    return urlPath + '?appKey=${AppKey}';
  }

  Future apiRequest(String urlPath, String method, [Map? data]) async {
    var response;
    switch (method.toUpperCase()) {
      case "GET": {
        try {
          response = await http.get(Uri.parse(urlPath), headers: {
            "Access-Control-Allow-Origin": "*" // Required for CORS support to work
          });
        } catch (e){
          print("apiRequestsGET: ${e.toString()}");
        }
        break;
      }
      case "POST": {
        try {
          response = await http.post(Uri.parse(urlPath), body: data, headers: {
            "Access-Control-Allow-Origin": "*"
          });
        } catch (e) {
          print("apiRequestsPOST: ${e.toString()}");
        }
        break;
      }
    }
    return json.decode(response.body);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }
}