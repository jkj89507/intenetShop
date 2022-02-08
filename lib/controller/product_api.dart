import 'base_api.dart';

const String getListProducts =
    'http://ostest.whitetigersoft.ru/api/common/product/list';

class ProductsFromQuest {
  final int productId;
  final String title;
  final String ?productDescription;
  final int ?price;
  final int ?rating;
  final String imageUrl;
  final List<dynamic> images;
  final int isAvailableForSale;

  const ProductsFromQuest({
    required this.productId,
    required this.title,
    required this.productDescription,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.images,
    required this.isAvailableForSale
  });

  factory ProductsFromQuest.fromJson(Map<String, dynamic> json) {
    return ProductsFromQuest(productId: json["productId"], title: json["title"],
                            productDescription: json["productDescription"], price: json["price"],
                            rating: json["rating"], imageUrl: json["imageUrl"],
                            images: json["images"], isAvailableForSale: json["isAvailableForSale"]);
  }
}

Future<List<ProductsFromQuest>> loadProducts() async {
  dynamic response = await baseApi().apiRequest(
      baseApi().totalQuestWithApiKey(getListProducts) +
          '&accessToken=${accessToken}',
      "GET");
  var productsListData = response["data"];
  List<ProductsFromQuest> products = [];
  for (var itemData in productsListData) {
    var product = ProductsFromQuest.fromJson(itemData);
    print(product.productId);
    print(product.title);
    print(product.productDescription);
    print(product.price);
    print(product.rating);
    print(product.imageUrl);
    print(product.images);
    print(product.isAvailableForSale);
    print("----------------------------------------");
    products.add(product);
  }
  return products;
}

void main() {
  loadProducts();
}