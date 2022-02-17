import 'package:flutter/material.dart';

class PannelControl extends StatelessWidget {
  List<dynamic> buttonNavigateList = [
    ["Товары", "/products"],
    ["Каталог товаров", "/categories"]
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: () {
            Navigator.pushNamed(context, buttonNavigateList[0][1]);
          },
          child: Text(
            buttonNavigateList[0][0].toString().toUpperCase(),
            style: TextStyle(
              fontSize: 15
            )
          )
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: () {
            Navigator.pushNamed(context, buttonNavigateList[1][1]);
          },
          child: Text(
              buttonNavigateList[1][0].toString().toUpperCase(),
              style: TextStyle(
                  fontSize: 15
              )
          )
        ),
      ],
    );
  }
}