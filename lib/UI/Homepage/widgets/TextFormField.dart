import 'package:flutter/material.dart';

TextFormField customField(String label, dynamic controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      focusColor: Colors.orange,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 2.0)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 2.0, color: Colors.orange)),
    ),
  );
}