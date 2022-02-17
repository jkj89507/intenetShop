import 'package:flutter/material.dart';
import 'package:flutter_projects/model/product/product.dart';
import 'package:flutter_projects/controller/product_api.dart';
import 'package:flutter_projects/view/base/base_page.dart';
import "package:flutter_rating_bar/flutter_rating_bar.dart";

class ProductPage extends BasePage {
  int? categoryId = 0;
  String? categoryTitle = "";
  ProductPage(int? categoryId, String? categoryTitle){
    this.categoryId = categoryId;
    this.categoryTitle = categoryTitle;
  }

  @override
  State<StatefulWidget> createState() {
    return _ProductPageState(this.categoryId, this.categoryTitle);
  }
}

class _ProductPageState extends BasePageState<ProductPage> {
  List<Product> _productList = [];
  int? categoryId = 0;
  String? categoryTitle = "";
  _ProductPageState(this.categoryId, this.categoryTitle);

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void loadData() async {
    _productList = (categoryId == 0)?
      await ProductApi().loadProducts() :
      await ProductApi().loadProductsByCategoryId(categoryId);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    if (_productList == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      // floatingActionButton: PannelControl(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      appBar: AppBar(
        title: Text(
            categoryTitle!
        ),
      ),
      body: buildBody(),
    );
  }

  @override
  Widget buildBody() {
    return Container(
      child: ListView.builder(
        itemCount: _productList.length,
        itemBuilder: (context, index) {
          return ProductListItem(context, _productList[index]);
        },
      ),
      margin: const EdgeInsets.only(top: 40),
    );
  }
}

class ProductListItem extends StatelessWidget{
  BuildContext ?context;
  Product ?product;
  ProductListItem(BuildContext context, Product product) {
    this.context = context;
    this.product = product;
  }

  Column codeAndTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Код "+product!.productId.toString(),
          style: const TextStyle(
            fontSize: 10,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          product!.title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 360,
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        margin: const EdgeInsets.fromLTRB(3, 8, 3, 0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.1,
            color: Colors.black,
          ),
          color: Colors.white54,
        ),
        child: Row (
          children: [
            Image.network(
              product!.imageUrl,
              errorBuilder: (context, error, stackTrace) {
                return const Align(
                  alignment: Alignment.center,
                  child: Text (
                    "404 \nNOT FOUND",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              width: 100,
              height: 100,
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  codeAndTitle(),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.1),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white54),
                    ),
                    onPressed: () {},
                    child: Text(
                      product!.price.toString() + "руб./шт.",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}