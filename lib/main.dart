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
      ),
    ),
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

  dynamic CategoryListItem(category,) {
    return Container(
      // move view/category_list_item.dart, CategoryListItem(category: category,)
      padding: EdgeInsets.fromLTRB(5, 5, 5, 7),
      color: Colors.white60,
      margin: EdgeInsets.fromLTRB(3, 5, 0, 0),
      child: Column(
        children: [
          Text(category.title, style: TextStyle(fontSize: 22)),
          Image.network(category.imageUrl, width: 200),
          ElevatedButton(
            onPressed: () {},
            child: Text("200", style: TextStyle(fontSize: 20)),
          )
        ],
      ),
    );
  }

  ListView buildList(context, categories,){
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var category = categories[index];
        return CategoryListItem(category);
      });
  }

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
            return buildList(context, categories);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
    );
    throw UnimplementedError();
  }
}
