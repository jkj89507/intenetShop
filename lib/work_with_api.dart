import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
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
      case "GET":
        response = await http.get(Uri.parse(urlPath));
        break;
      case "POST":
        response = await http.post(Uri.parse(urlPath), body: data);
        break;
    }
    if (response.statusCode == 200) {
      return json.decode(response.body);
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
    }
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

Future<int> getNumberOfProducts() async{
  dynamic respone = await baseApi().apiRequest(
      baseApi().totalQuestWithApiKey(getListCategory) +
          '&accessToken=${accessToken}',
      "GET");
  int lenOfElements = 0;
  for (var i = 0; i < (respone["data"]["categories"].toString().length); i++) {
    if (respone["data"]["categories"].toString()[i] == '}') {
      lenOfElements++;
    }
  }
  return lenOfElements;
}

Future<List<ProductFromQuest>> getProducts() async{
  dynamic respone = await baseApi().apiRequest(
      baseApi().totalQuestWithApiKey(getListCategory) +
          '&accessToken=${accessToken}',
      "GET");
  int lenOfElements = 0;
  for (var i = 0; i < (respone["data"]["categories"].toString().length); i++) {
    if (respone["data"]["categories"].toString()[i] == '}') {
      lenOfElements++;
    }
  }
   List<ProductFromQuest> products = [];
  for (var i = 0; i < lenOfElements; i++) {
    ProductFromQuest temp = ProductFromQuest.fromJson(respone["data"]["categories"][i]);
    print(temp.title);
    products.add(temp);
  }
  return products;
  // print(product.title);
  // print(product.categoryDescription);
  // print(product.imageUrl);
}


void main(){
  List<ProductFromQuest> t = [];
  getProducts().then((value){
    print(value.first.fullName);
  });
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
