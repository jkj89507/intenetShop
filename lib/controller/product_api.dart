import 'base_api.dart';
import 'package:flutter_projects/model/product/product.dart';

class ProductApi {
  final String getListProducts = 'api/common/product/list';
  Future<List<Product>> loadProducts(int? offset) async {
    dynamic response = await baseApi().sendGetRequest(
        endPoint: getListProducts,
        params: {"offset": offset.toString()}
    );
    var productsListData = response["data"];
    List<Product> products = [];
    for (var itemData in productsListData) {
      var product = Product.fromJson(itemData);
      products.add(product);
    }
    return products;
  }

  Future<List<Product>> loadProductsByCategoryId(int? categoryId) async {
    dynamic response = await baseApi().sendGetRequest(
        endPoint: getListProducts,
        params: {"categoryId" : categoryId.toString()}
    );
    var productsListData = response["data"];
    List<Product> products = [];
    for (var itemData in productsListData) {
      var product = Product.fromJson(itemData);
      products.add(product);
    }
    return products;
  }
}

void main() {
  ProductApi().loadProducts(10).then((value) => {
    for (var i = 0; i < value.length; i++) {
      print(value[i].title)
    }
  });
}