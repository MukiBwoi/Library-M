import 'package:flutter/material.dart';

showSnack(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: Color(0xffff5722),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
