import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_rating_bar/flutter_rating_bar.dart";

dynamic ProductListItem(product,) {
  dynamic containerRatingTitle (){
    return Container(
      height: 70,
      margin: EdgeInsets.only(top: 20),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: EdgeInsets.symmetric(horizontal: 0.1),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.red,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      )
    );
  }

  dynamic containerCodeImage (){
    return Container(
      height: 160,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Код "+product.productId.toString(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.network(
              product.imageUrl,
              width: 140,
              height: 140,
            ),
          ),
        ]
      ),
    );
  }

  dynamic containerBuyButton () {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white54),
          ),
          onPressed: () {},
          child: Text(
            product.price.toString() + "руб./шт.",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  return Container(
    padding: EdgeInsets.fromLTRB(5, 5, 5, 7),
    margin: EdgeInsets.fromLTRB(3, 5, 0, 0),
    decoration: BoxDecoration(
      border: Border.all(
          width: 0.1,
          color: Colors.black,
      ),
      color: Colors.white54,
    ),
    child: Center(
      child: Column (
        children: [
          containerCodeImage(),
          containerRatingTitle(),
          containerBuyButton(),
        ]
      ),
    ),
  );
}