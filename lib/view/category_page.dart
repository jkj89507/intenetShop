import 'package:flutter/material.dart';
import 'package:flutter_projects/controller/category_api.dart';
import 'package:flutter_projects/model/pannel_control.dart';
import 'package:flutter_projects/model/category/category.dart';
import 'package:flutter_projects/view/base/base_page.dart';
import 'package:flutter_projects/view/components/category_list_item.dart';
import 'product_page.dart';

class CategoryPage extends BasePage {
  @override
  State<StatefulWidget> createState() {
    return _CategoryPageState();
  }
}

class _CategoryPageState extends BasePageState<CategoryPage> {
  List<Category> _categoryList = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void loadData() async {
    _categoryList = await CategoryApi().loadCategories();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_categoryList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: PannelControl(),
      ),
      body: buildBody(),
    );
  }

  @override
  Widget buildBody() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
       ),
        itemCount: _categoryList.length,
        itemBuilder: (context, index) {
          return CategoryListItem(_categoryList[index]);
        }
      ),
    );
  }
}