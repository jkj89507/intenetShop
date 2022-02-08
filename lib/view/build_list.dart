import 'package:flutter/material.dart';
import 'package:flutter_projects/view/category_list_item.dart';

GridView buildList(context, categories,){
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 1,
        crossAxisSpacing: 0.1,
        mainAxisSpacing: 0.1,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var category = categories[index];
        return CategoryListItem(category);
      }
  );
}