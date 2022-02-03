import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_projects/work_with_api.dart';

// var products = getProducts(1);
// List<Card> testListCards = [
//   Card(ProductFromQuest.fromJson(products).title, ProductFromQuest.fromJson(products).imageUrl, "200"),
//
// ];

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[PannelControl(), ProductCards()],
      ),
    )),
  ));
}

class PannelControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        height: 40,
        color: Colors.deepOrangeAccent,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(3, 5, 0, 5),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Товары", style: TextStyle(fontSize: 17)),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(3, 5, 0, 5),
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Каталог товаров",
                        style: TextStyle(fontSize: 17))))
          ],
        ));
  }
}

class Card {
  String title = "";
  String description = "";
  String price = "";

  Card(String title, String description, String price) {
    this.title = title;
    this.description = description;
    this.price = price;
  }
}

class ProductCards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductCards ();
  }
}

class _ProductCards extends State<ProductCards> {

  late Future<List<ProductFromQuest>> _ListProducts;
  late Future<int> _amountOfProducts;

  @override
  void initState(){
    super.initState();
    _ListProducts = getProducts();
    _amountOfProducts = getNumberOfProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: FutureBuilder<List<ProductFromQuest>> (
        future: _ListProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            List<ProductFromQuest> products = snapshot.data ?? [];
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  ProductFromQuest product = products[index];
                  return Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 7),
                      color: Colors.white60,
                      margin: EdgeInsets.fromLTRB(3, 5, 0, 0),
                      width: 100,
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Text(product.title,
                              style: TextStyle(fontSize: 22)),
                          Text(product.imageUrl,
                              style: TextStyle(fontSize: 17)),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("200",
                                style: TextStyle(fontSize: 20)),
                          )
                        ],
                      ));
                }
            );
          }
          else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
    throw UnimplementedError();
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return throw UnimplementedError();
  }
}
