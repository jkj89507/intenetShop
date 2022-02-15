import '../../controller/base_api.dart';

class Product {
  final int productId;
  final String title;
  final String ?productDescription;
  final int ?price;
  final int ?rating;
  final String imageUrl;
  final List<dynamic> images;
  final int isAvailableForSale;

  const Product({
    required this.productId,
    required this.title,
    required this.productDescription,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.images,
    required this.isAvailableForSale
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(productId: json["productId"], title: json["title"],
                            productDescription: json["productDescription"], price: json["price"],
                            rating: json["rating"], imageUrl: json["imageUrl"],
                            images: json["images"], isAvailableForSale: json["isAvailableForSale"]);
  }
}