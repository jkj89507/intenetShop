import 'base_api.dart';
import 'package:flutter_projects/model/product/product.dart';

const String getListProducts =
    'http://ostest.whitetigersoft.ru/api/common/product/list';

class ProductApi {
  Future<List<Product>> loadProducts() async {
    dynamic response = await baseApi().apiRequest(
        baseApi().totalQuestWithApiKey(getListProducts) +
            '&accessToken=$accessToken',
        "GET");
    var productsListData = response["data"];
    List<Product> products = [];
    for (var itemData in productsListData) {
      var product = Product.fromJson(itemData);
      products.add(product);
    }
    return products;
  }

  Future<List<Product>> loadProductsByCategoryId(int? categoryId) async {
    dynamic response = await baseApi().apiRequest(
        baseApi().totalQuestWithApiKey(getListProducts) +
            '&accessToken=$accessToken' +
            '&categoryId=$categoryId',
        "GET");
    var productsListData = response["data"];
    List<Product> products = [];
    for (var itemData in productsListData) {
      var product = Product.fromJson(itemData);
      products.add(product);
    }
    return products;
  }
}