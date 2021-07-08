import 'package:flutter/material.dart';
import 'Widgets.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 130, 20, 0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 36, 15, 36),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 155.0,
                        child: Image.asset(
                          "assets/icon.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 45.0),
                      emailField(),
                      SizedBox(height: 25.0),
                      passwordField(),
                      SizedBox(
                        height: 35.0,
                      ),
                      loginButton(context),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
