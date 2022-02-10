import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PannelControl extends StatelessWidget {
  List<dynamic> buttonNavigateList = [
    ["Товары", "/products"],
    ["Каталог товаров", "/categories"]
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.3,
          color: Colors.black,
        ),
        color: Colors.white54,
      ),
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: buttonNavigateList.length,
        itemBuilder: (
            BuildContext context,
            int index,
        ) {
         return Padding(
           padding: EdgeInsets.fromLTRB(3, 3, 12, 3),
           child: ElevatedButton(
             style: ElevatedButton.styleFrom(
               primary: Colors.red,
             ),
             onPressed: () {
               Navigator.pushNamed(context, buttonNavigateList[index][1]);
             },
             child: Text(buttonNavigateList[index][0].toString().toUpperCase(), style: TextStyle(fontSize: 15)
             ),
           ),
         );
        }
      )
    );
  }
}