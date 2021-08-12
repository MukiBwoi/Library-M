import 'package:flutter/material.dart';

showSnack(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: Color(0xff00c853),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
