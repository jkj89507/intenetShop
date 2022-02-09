import 'package:flutter/material.dart';
import 'package:flutter_projects/model/category/category_cards.dart';
import 'package:flutter_projects/model/pannel_control.dart';
import 'package:flutter_projects/model/product/products_cards.dart';

void main() {
  runApp(MaterialApp(
    title: 'InernetShop',
    home: MyScaffold(),
  ));
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PannelControl(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: ProductCards(),
    );
  }
}
