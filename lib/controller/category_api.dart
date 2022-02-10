import 'base_api.dart';

const String getListCategory =
    'http://ostest.whitetigersoft.ru/api/common/category/list';

class CategoriesFromQuest {
  final int categoryId;
  final String title;
  final String imageUrl;
  final int hasSubcategories;
  final String fullName;
  final String ?categoryDescription;

  const CategoriesFromQuest({
    required this.categoryId,
    required this.title,
    required this.imageUrl,
    required this.hasSubcategories,
    required this.fullName,
    required this.categoryDescription,
  });

  factory CategoriesFromQuest.fromJson(Map<String, dynamic> json) {
    return CategoriesFromQuest(categoryId: json['categoryId'], title: json['title'],
                            imageUrl: json['imageUrl'], hasSubcategories: json['hasSubcategories'],
                            fullName: json['fullName'], categoryDescription: json['categoryDescription']);
  }
}

Future<List<CategoriesFromQuest>> loadCategories() async {
  dynamic response = await baseApi().apiRequest(
      baseApi().totalQuestWithApiKey(getListCategory) +
          '&accessToken=${accessToken}',
      "GET");
  var categoryListData = response["data"]["categories"];
  List<CategoriesFromQuest> categories = [];
  for (var itemData in categoryListData) {
    var category = CategoriesFromQuest.fromJson(itemData);
    categories.add(category);
  }
  return categories;
}

main() {
  loadCategories().then((value) {
    for (var i = 0; i < value.length; i++) {
      print(value[i].categoryId);
      print(value[i].title);
    }
  });
}