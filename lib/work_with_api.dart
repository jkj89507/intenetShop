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

class ProductFromQuest {
  final int categoryId;
  final String title;
  final String imageUrl;
  final int hasSubcategories;
  final String fullName;
  final String ?categoryDescription;

  const ProductFromQuest({
    required this.categoryId,
    required this.title,
    required this.imageUrl,
    required this.hasSubcategories,
    required this.fullName,
    required this.categoryDescription,
  });

  factory ProductFromQuest.fromJson(Map<String, dynamic> json) {
    return ProductFromQuest(categoryId: json['categoryId'], title: json['title'],
                            imageUrl: json['imageUrl'], hasSubcategories: json['hasSubcategories'],
                            fullName: json['fullName'], categoryDescription: json['categoryDescription']);
  }
}

Future<List<ProductFromQuest>> loadCategories() async {
  dynamic response = await baseApi().apiRequest(
      baseApi().totalQuestWithApiKey(getListCategory) +
          '&accessToken=${accessToken}',
      "GET");
  var categoryListData = response["data"]["categories"];
  List<ProductFromQuest> categories = [];
  for (var itemData in categoryListData) {
    var category = ProductFromQuest.fromJson(itemData);
    categories.add(category);
  }
  return categories;
}


// main() {
//   Future<List<ProductFromQuest>> test = loadCategories();
//   test.then((value){
//     for (var i = 0; i < value.length; i++) {
//       print(value[i].fullName);
//     }
//   });
// }

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
