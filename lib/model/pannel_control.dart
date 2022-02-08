import 'package:flutter/material.dart';

class PannelControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(3, 5, 0, 5),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Товары", style: TextStyle(fontSize: 17)),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(3, 5, 0, 5),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Каталог товаров",
                      style: TextStyle(fontSize: 17))))
        ],
      )
    );
  }
}