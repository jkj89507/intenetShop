import 'package:flutter_projects/controller/base_api.dart';
import 'package:flutter_projects/model/category/category.dart';

class CategoryApi{
  final String getListCategory =
      'api/common/category/list';
  Future<List<Category>> loadCategories() async {
    dynamic response = await BaseApi().sendGetRequest(endPoint: getListCategory);
    var categoryListData = response["data"]["categories"];
    List<Category> categories = [];
    for (var itemData in categoryListData) {
      var category = Category.fromJson(itemData);
      categories.add(category);
    }
    return categories;
  }
}