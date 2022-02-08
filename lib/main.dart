import 'package:flutter/material.dart';
import 'package:flutter_projects/model/category/category_cards.dart';
import 'package:flutter_projects/model/pannel_control.dart';

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
