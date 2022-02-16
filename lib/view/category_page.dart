import 'package:flutter/material.dart';
import 'package:flutter_projects/controller/category_api.dart';
import 'package:flutter_projects/model/category/category.dart';
import 'product_page.dart';
import 'package:flutter_projects/view/base/base_page.dart';
import 'package:flutter_projects/model/pannel_control.dart';

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
    if (_categoryList == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      floatingActionButton: PannelControl(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: buildBody(),
    );
  }

  @override
  Widget buildBody() {
    return Container(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
       ),
        itemCount: _categoryList.length,
        itemBuilder: (context, index) {
          return CategoryListItem(context, _categoryList[index]);
        }
      ),
    );
  }
}

StatelessWidget CategoryListItem(context, category,) {
  return Container(
    padding: EdgeInsets.fromLTRB(5, 5, 5, 7),
    margin: EdgeInsets.fromLTRB(1, 5, 0, 0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white54,),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 50),
        child: ListView(
          children: [
            Image.network(
              category.imageUrl,
              width: 140,
              height: 140,
            ),
            Center(
              child: Text(
                  category.title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  )
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(category.categoryId)));
      },
    ),
  );
}