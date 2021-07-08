import 'package:flutter/material.dart';

TextStyle style = TextStyle(fontSize: 20.0);

Widget emailField() {
  return TextField(
    obscureText: false,
    style: style,
    decoration: InputDecoration(
      labelStyle: TextStyle(
        fontSize: 17.0,
        color: Color(0xffff5722),
      ),
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      labelText: "Email",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      icon: Icon(
        Icons.person,
        color: Color(0xffff5722),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffff5722),
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(30.0),
              topRight: Radius.circular(30.0))),
    ),
  );
}

Widget passwordField() {
  return TextField(
    obscureText: true,
    style: style,
    decoration: InputDecoration(
      labelText: "Password",
      labelStyle: TextStyle(
        fontSize: 17.0,
        color: Color(0xffff5722),
      ),
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      icon: Icon(
        Icons.lock,
        color: Color(0xffff5722),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffff5722),
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(30.0),
              topRight: Radius.circular(30.0))),
    ),
  );
}

Widget loginButton(BuildContext context) {
  return Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: Color(0xffff5722),
    child: MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {},
      child: Text("Login",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );
}
