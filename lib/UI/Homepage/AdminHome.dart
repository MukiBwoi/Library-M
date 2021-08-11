import 'package:flutter/material.dart';
import 'package:new_app/Service/auth.dart';
import 'package:new_app/UI/Homepage/widgets/Appbar.dart';
import 'package:new_app/UI/Homepage/widgets/floatingactionbutton.dart';

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
    final dynamic _height = MediaQuery.of(context).size.height;
    final dynamic _width = MediaQuery.of(context).size.width;

    return Scaffold(
        floatingActionButton: FloatingButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: customAppBar(_route),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Image(
                          image: NetworkImage(
                              "https://m.media-amazon.com/images/I/51m2ovYhjTL.jpg"),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "Book Cover",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Student Name : \nMuksith",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Rack No : \n005",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  color: Color(0xff00c853),
                                  onPressed: () {},
                                  child: Text(
                                    "Update",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                MaterialButton(
                                  color: Color(0xffd32f2f),
                                  onPressed: () {},
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
