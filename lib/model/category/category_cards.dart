import 'package:flutter/material.dart';
import 'package:flutter_projects/view/build_list.dart';
import 'package:flutter_projects/controller/category_api.dart';
import 'package:flutter_projects/view/category/category_list_item.dart';

class CategoryCards extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CategoryCards();
  }
}

class _CategoryCards extends State<CategoryCards> {
  late Future<List<CategoriesFromQuest>> _categoryList;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData(){
    _categoryList = loadCategories();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    if (_categoryList == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return FutureBuilder<List<CategoriesFromQuest>>(
      future: _categoryList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var categories = snapshot.data ?? [];
          return buildList(context, categories, CategoryListItem);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
    throw UnimplementedError();
  }
}