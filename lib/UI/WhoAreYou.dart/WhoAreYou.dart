import 'package:flutter/material.dart';
import 'package:new_app/UI/Login/AdminLogin.dart';
import 'package:new_app/UI/Login/StudentLogin.dart';
import 'package:new_app/UI/WhoAreYou.dart/Widgets.dart';

class WhoAreYou extends StatelessWidget {
  const WhoAreYou({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              whoareyou(_height / 10, _width / 3),
              box("./assets/student.png", StudentLogin(), context),
              box("./assets/admin.png", AdminLogin(), context),
            ],
          ),
        ),
      ),
    );
  }
}
