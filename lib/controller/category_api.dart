import 'base_api.dart';
import 'package:flutter_projects/model/category/category.dart';

const String getListCategory =
    'http://ostest.whitetigersoft.ru/api/common/category/list';

class CategoryApi{
  Future<List<Category>> loadCategories() async {
    dynamic response = await baseApi().apiRequest(
        baseApi().totalQuestWithApiKey(getListCategory) +
            '&accessToken=$accessToken',
        "GET");
    var categoryListData = response["data"]["categories"];
    List<Category> categories = [];
    for (var itemData in categoryListData) {
      var category = Category.fromJson(itemData);
      categories.add(category);
    }
    return categories;
  }
}