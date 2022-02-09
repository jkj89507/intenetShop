import 'package:flutter/material.dart';

dynamic CategoryListItem(category,) {
  return Container(
    // move view/category_list_item.dart, CategoryListItem(category: category,)
    padding: EdgeInsets.fromLTRB(5, 5, 5, 7),
    margin: EdgeInsets.fromLTRB(3, 5, 0, 0),
    child: ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white54),
      ),
      child: Center(
        child: Column (
            children: [
              Image.network(category.imageUrl, width: 140),
              Text(
                  category.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  )
              ),
            ]
        ),
      ),
    ),
  );
}