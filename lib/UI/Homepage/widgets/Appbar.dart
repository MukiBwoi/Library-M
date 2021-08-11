import 'package:flutter/material.dart';

AppBar customAppBar(dynamic route) {
  return AppBar(
    leading: Icon(
      Icons.home,
      color: Colors.white,
    ),
    backgroundColor: Color(0xffff5722),
    actions: [
      MaterialButton(
        color: Color(0xffff5722),
        onPressed: route,
        child: Row(
          children: [
            Text(
              "Sign out",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ],
  );
}


