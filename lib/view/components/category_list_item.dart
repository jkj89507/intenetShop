import 'package:flutter/material.dart';
import 'package:flutter_projects/model/category/category.dart';
import 'package:flutter_projects/view/product_page.dart';

class CategoryListItem extends StatelessWidget {
  Category ?category;
  CategoryListItem(Category category,) {
    this.category = category;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 7),
      margin: const EdgeInsets.fromLTRB(1, 5, 0, 0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white54,),
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          child: ListView(
            children: [
              Image.network(
                category!.imageUrl,
                width: 140,
                height: 140,
              ),
              Center(
                child: Text(
                    category!.title,
                    style: const TextStyle(
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
              MaterialPageRoute(builder: (context) => ProductPage(category!.categoryId, category!.title)));
        },
      ),
    );
  }
}