import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Service/auth.dart';
import 'package:new_app/Service/database.dart';
import 'package:new_app/UI/Homepage/widgets/Appbar.dart';
import 'package:new_app/UI/Homepage/widgets/floatingactionbutton.dart';
import 'package:new_app/UI/Homepage/widgets/updateForm.dart';
import 'package:new_app/UI/Login/Loading.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final AuthService _auth = AuthService();

  void _route() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic _width = MediaQuery.of(context).size.width;

    return Scaffold(
        floatingActionButton: FloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: customAppBar(_route, "Admin Panel"),
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
              physics: BouncingScrollPhysics(),
              children: snapshot.data.docs.map((document) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  height: 300,
                  width: _width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          document['Book_Name'],
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
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50),
                            color: Color(0xff00c853),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateForm(
                                      id: document.id,
                                      oldBName: document['Book_Name'],
                                      oldRNo: document['Rack_No'],
                                      oldSName: document['Std_Name'],
                                    ),
                                  ));
                            },
                            child: Text(
                              "Update",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          MaterialButton(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50),
                            color: Color(0xffd32f2f),
                            onPressed: () async {
                              await DatabaseService().deleteItem(document.id);
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
