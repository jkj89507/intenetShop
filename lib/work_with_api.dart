import 'dart:convert';

import 'package:http/http.dart' as http;

const String accessToken = 'vsRtpYX-sOHlOV-tljYEPSbqABF7Q5Xy';
const String AppKey =
    'phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF';

const String questOffer =
    'http://ostest.whitetigersoft.ru/api/common/product/list';

const String authSendCode =
    'http://ostest.whitetigersoft.ru/api/common/auth/send-sms';
Map authSendCodeParams = {"phone": "89021007014"};

const String authRegistration =
    'http://ostest.whitetigersoft.ru/api/common/auth/login-by-phone';

const String getListCategory =
    'http://ostest.whitetigersoft.ru/api/common/category/list';

class AppApi {
  String totalQuestWithApiKey(String urlPath) {
    return urlPath + '?appKey=${AppKey}';
  }

  Future apiRequest(String urlPath, String method, [Map? data]) async {
    var response;
    switch (method.toUpperCase()) {
      case "GET":
        response = await http.get(Uri.parse(urlPath));
        break;
      case "POST":
        response = await http.post(Uri.parse(urlPath), body: data);
        break;
    }
    return json.decode(response.body);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }
}

var test = AppApi();

void main() async {
  var respone = await test.apiRequest(
      test.totalQuestWithApiKey(getListCategory) +
          '&accessToken=${accessToken}',
      "GET");
  print(respone["data"]["categories"]);
}

// main() async {
//   // print(await apiRequest(
//   //     totalQuestWithApiKey(authSendCode), "POST", authSendCodeParams));
//
//   // print(await (apiRequest(totalQuestWithApiKey(authRegistration), "POST",
//   //     {"phone": "89021007014", "code": stdin.readLineSync(encoding: utf8)})));
//
// //   print(await apiRequest(
// //       totalQuestWithApiKey(getListCategory) + '&accessToken=${accessToken}',
// //       "GET"));
// // }
