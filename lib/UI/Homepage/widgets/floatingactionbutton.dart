import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Color(0xffff5722),
      onPressed: () {},
      icon: Icon(
        Icons.add,
        color: Colors.white,
      ),
      label: Text("Add", style: TextStyle(color: Colors.white)),
    );
  }
}
