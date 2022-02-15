import 'package:flutter/material.dart';
import 'package:flutter_projects/model/product/products_cards.dart';
import 'package:flutter_projects/model/pannel_control.dart';

class ProductPage extends StatelessWidget {
  int? categoryId = 0;
  ProductPage(int? categoryId){
    this.categoryId = categoryId;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PannelControl(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: ProductCards(categoryId),
    );
  }
}