import 'package:flutter/material.dart';
import 'package:flutter_projects/view/build_list.dart';
import 'package:flutter_projects/controller/product_api.dart';
import 'package:flutter_projects/view/product/product_list_item.dart';

class ProductCards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductCards();
  }
}

class _ProductCards extends State<ProductCards> {
  late Future<List<ProductsFromQuest>> _ProductList;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData(){
    _ProductList = loadProducts();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    if (_ProductList == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: FutureBuilder<List<ProductsFromQuest>>(
      future: _ProductList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var categories = snapshot.data ?? [];
          return buildList(context, categories, ProductListItem);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    )
    );
    throw UnimplementedError();
  }
}