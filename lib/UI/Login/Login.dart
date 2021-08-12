import 'package:flutter/material.dart';
import 'package:new_app/Service/auth.dart';
import 'package:new_app/UI/Homepage/AdminHome.dart';
import 'package:new_app/UI/Homepage/UserHome.dart';
import 'package:new_app/UI/Homepage/widgets/Snackbar.dart';
import 'package:new_app/UI/Login/Loading.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextStyle style = TextStyle(fontSize: 20.0);
  final AuthService _auth = AuthService();
  bool loading = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
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

                              // email field
                              TextFormField(
                                controller: email,
                                obscureText: false,
                                style: style,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    fontSize: 17.0,
                                    color: Color(0xffff5722),
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
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
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Enter your email";
                                  }
                                  return null;
                                },
                              ),
                              //end of email

                              SizedBox(height: 25.0),
                              //password field
                              TextFormField(
                                controller: password,
                                obscureText: true,
                                style: style,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    fontSize: 17.0,
                                    color: Color(0xffff5722),
                                  ),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
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
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Enter your Password";
                                  }
                                  return null;
                                },
                              ),
                              //end of password field

                              SizedBox(
                                height: 35.0,
                              ),
                              //login button
                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(30.0),
                                color: Color(0xffff5722),
                                child: MaterialButton(
                                  minWidth: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      dynamic result = await _auth
                                          .signInWithEmailAndPassword(
                                              email.text, password.text);
                                      if (result == null) {
                                        showSnack(
                                            context, "Enter Valid Credentials");
                                        setState(() {
                                          loading = false;
                                        });
                                      } else if (result.uid ==
                                          "uikXGaISbvRMFN8b3cI7xSFtXff1") {
                                        return AdminHome();
                                      } else {
                                        return UserHome();
                                      }
                                    }
                                  },
                                  child: Text("Login",
                                      textAlign: TextAlign.center,
                                      style: style.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              //end of login button

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
            ),
          );
  }
}
