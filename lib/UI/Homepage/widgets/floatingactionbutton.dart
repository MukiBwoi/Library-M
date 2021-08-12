import 'package:flutter/material.dart';

import 'package:new_app/UI/Homepage/widgets/addForm.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Color(0xffff5722),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddForm()));
      },
      icon: Icon(
        Icons.add,
        color: Colors.white,
      ),
      label: Text("Add", style: TextStyle(color: Colors.white)),
    );
  }
}
