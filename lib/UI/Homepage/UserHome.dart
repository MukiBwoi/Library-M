import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Service/auth.dart';
import 'package:new_app/UI/Homepage/widgets/Appbar.dart';
import 'package:new_app/UI/Homepage/widgets/Snackbar.dart';
import 'package:new_app/UI/Homepage/widgets/addForm.dart';

import 'package:new_app/UI/Login/Loading.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final AuthService _auth = AuthService();
  void _route() async {
    await _auth.signOut();
    showSnack(context, "You are signed out");
  }

  @override
  Widget build(BuildContext context) {
    final dynamic _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: customAppBar(_route, "Student"),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('student').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Loading(),
              );
            }

            return ListView(
              reverse: true,
              physics: BouncingScrollPhysics(),
              children: snapshot.data.docs.map((document) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      whiteSpace(20),
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: _width * 0.9,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                document['Book_Name'].toUpperCase(),
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Student Name : \n" + document['Std_Name'],
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Rack No : \n" + document['Rack_No'],
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      whiteSpace(40)
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
