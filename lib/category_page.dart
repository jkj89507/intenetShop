import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/model/category/category_cards.dart';
import 'package:flutter_projects/model/pannel_control.dart';

class CategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PannelControl(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: CategoryCards(),
    );
  }
}