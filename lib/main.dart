import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

List<Card> testListCards = [
  Card("First", "first", "200"),
  Card("First", "first", "200"),
  Card("First", "first", "200")
];

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

class ProductCards extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: testListCards.length * 105,
        child: ListView.builder(
          itemCount: testListCards.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 7),
                color: Colors.white60,
                margin: EdgeInsets.fromLTRB(3, 5, 0, 0),
                width: 100,
                height: 100,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Text(testListCards[index].title,
                        style: TextStyle(fontSize: 22)),
                    Text(testListCards[index].description,
                        style: TextStyle(fontSize: 17)),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(testListCards[index].price,
                          style: TextStyle(fontSize: 20)),
                    )
                  ],
                ));
          },
        ));
    throw UnimplementedError();
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return throw UnimplementedError();
  }
}
