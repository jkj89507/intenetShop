import 'package:flutter/material.dart';
import 'package:flutter_projects/view/category_page.dart';
import 'package:flutter_projects/view/product_page.dart';
import 'package:flutter_projects/model/pannel_control.dart';

void main() {
  runApp(MaterialApp(
    title: 'InernetShop',
    initialRoute: '/',
    routes: {
      '/products': (context) => ProductPage(0),
      '/categories': (context) => CategoryPage(),
    },
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
      // body: CategoryCards(),
    );
  }
}
