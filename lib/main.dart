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
          child: CategoryCards(),
      // child: Column(
      //   children: <Widget>[PannelControl(), CategoryCards()],
      // ),
    )),
  ));
}

class PannelControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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

class CategoryCards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryCards();
  }
}

class _CategoryCards extends State<CategoryCards> {
  late Future<List<ProductFromQuest>> _categoryList;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData(){
    _categoryList = loadCategories();
    setState(() { });
  }

  //TODO: https://www.notion.so/whitetigersoft/c142becb80bf4191886e5334a2a13515
  @override
  Widget build(BuildContext context) {
    if (_categoryList == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return FutureBuilder<List<ProductFromQuest>>(
        future: _categoryList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var categories = snapshot.data ?? [];
            return ListView.builder(
              //TODO: move to buildList(context, categories)
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  var category = categories[index];
                  return Container(
                    // move view/category_list_item.dart, CategoryListItem(category: category,)
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 7),
                      color: Colors.white60,
                      margin: EdgeInsets.fromLTRB(3, 5, 0, 0),
                      child: Column(
                        children: [
                          Text(category.title, style: TextStyle(fontSize: 22)),
                          Text(category.imageUrl,
                              style: TextStyle(fontSize: 17)),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("200", style: TextStyle(fontSize: 20)),
                          )
                        ],
                      ));
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
    );
    throw UnimplementedError();
  }
}
