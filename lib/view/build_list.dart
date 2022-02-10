import 'package:flutter/material.dart';

GridView buildList(context, item, type,){
  return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: item.length,
      itemBuilder: (context, index) {
        return type(item[index]);
      }
  );
}