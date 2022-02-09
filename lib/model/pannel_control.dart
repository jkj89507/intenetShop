import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PannelControl extends StatelessWidget {
  List<dynamic> buttonNavigateList = [["Товары",(){}],["Каталог товаров",(){}]];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Colors.deepOrangeAccent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: buttonNavigateList.length,
        itemBuilder: (
            BuildContext context,
            int index,
        ) {
         return Padding(
           padding: EdgeInsets.fromLTRB(3, 3, 0, 3),
           child: ElevatedButton(
             onPressed: buttonNavigateList[index][1],
             child: Text(buttonNavigateList[index][0], style: TextStyle(fontSize: 12)
             ),
           ),
         );
        }
      )
    );
  }
}