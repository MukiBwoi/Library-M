import 'package:flutter/material.dart';

Widget logo(double height, double width) {
  return Container(
    height: height / 3,
    width: width / 3,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("./assets/icon.png"),
      ),
    ),
  );
}

Widget appname(double height, double width) {
  return Container(
    height: height / 3,
    width: width / 3,
    child: FittedBox(
      fit: BoxFit.contain,
      child: Text("Library \nSystem\nfor Students"),
    ),
  );
}
