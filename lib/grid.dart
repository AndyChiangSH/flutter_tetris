// create grid that display on home page

import 'package:flutter/material.dart';
import 'game.dart';

List<Color> blockColors = [
  Colors.cyanAccent,
  Colors.blueAccent[700],
  Colors.orange,
  Colors.yellowAccent,
  Colors.lightGreenAccent[700],
  Colors.purpleAccent,
  Colors.red,
];

Widget getGrid() {

  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: GridView.builder(
      itemCount: 150,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
      itemBuilder: (BuildContext context, int index) {
        Color singleGridColor;
        if (gridList[index] == -1) {
          singleGridColor = Colors.black;
        }
        else {
          singleGridColor = blockColors[gridList[index]];
        }
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[900], width: 1),
            borderRadius: BorderRadius.circular(10),
            color: singleGridColor,
          ),
          child: Text(index.toString(), style: TextStyle(color: Colors.white),),
        );
      },
    ),
  );
}