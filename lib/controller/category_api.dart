import 'base_api.dart';
import 'package:flutter_projects/model/category/category.dart';

class CategoryApi{
  final String getListCategory =
      'api/common/category/list';
  Future<List<Category>> loadCategories() async {
    dynamic response = await baseApi().sendGetRequest(endPoint: getListCategory);
    var categoryListData = response["data"]["categories"];
    List<Category> categories = [];
    for (var itemData in categoryListData) {
      var category = Category.fromJson(itemData);
      categories.add(category);
    }
    return categories;
  }
}

void main() {
  CategoryApi().loadCategories().then((value) => {
    for(var i = 0; i < value.length; i++){
      print(value[i].title)
    }
  });
}