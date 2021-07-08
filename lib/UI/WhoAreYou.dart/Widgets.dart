import 'package:flutter/material.dart';

Widget whoareyou(double _height, double _width) {
  return Container(
    height: _height,
    width: _width,
    child: FittedBox(
      fit: BoxFit.contain,
      child: Text("Login as",style: TextStyle(),),
    ),
  );
}

Widget box(String pathtoImg, route, BuildContext context) {
  var _height = MediaQuery.of(context).size.height;
  var _width = MediaQuery.of(context).size.width;
  return Container(
    child: Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Image(
            image: AssetImage(pathtoImg),
            fit: BoxFit.cover,
          ),
        ),
        splashColor: Colors.grey,
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        },
      ),
    ),
    height: _height / 4,
    width: _width / 2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  );
}
