import 'package:flutter/material.dart';
import 'package:flutter_projects/model/product/product.dart';
import 'package:flutter_projects/controller/product_api.dart';
import 'package:flutter_projects/view/base/base_page.dart';
import 'package:flutter_projects/view/components/product_list_item.dart';

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
    loadData();
    super.initState();
  }

  @override
  void loadData() async {
    _productList = (categoryId == 0)?
      await ProductApi().loadProducts(4) :
      await ProductApi().loadProductsByCategoryId(categoryId);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    if (_productList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
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
    ScrollController _controller = ScrollController();
    return Container(
      child: ListView.builder(
        controller: _controller,
        itemCount: _productList.length,
        itemBuilder: (context, index) {
          return ProductListItem(_productList[index]);
        },
      ),
      margin: const EdgeInsets.only(top: 40),
    );
  }
}