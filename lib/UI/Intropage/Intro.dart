import 'dart:async';
import '../WhoAreYou.dart/WhoAreYou.dart';
import 'package:flutter/material.dart';
import 'Widgets.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WhoAreYou()));
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: _height,
      width: _width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logo(_height, _width),
                  appname(_height, _width),
                ],
              ),
            ),
            SizedBox(
              height: _height / 8,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.amber,
            )
          ],
        ),
      ),
    ));
  }
}