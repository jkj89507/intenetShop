import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_projects/product_page.dart';

dynamic CategoryListItem(context, category,) {
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