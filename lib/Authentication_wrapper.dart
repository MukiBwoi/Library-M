import 'package:flutter/material.dart';
import 'package:new_app/UI/Homepage/UserHome.dart';
import 'package:new_app/UI/Login/Login.dart';
import 'package:new_app/models/user.dart';
import 'package:provider/provider.dart';

import 'UI/Homepage/AdminHome.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);

    if (user == null) {
      return Login();
    } else if (user.uid == "uikXGaISbvRMFN8b3cI7xSFtXff1") {
      return AdminHome();
    } else {
      return UserHome();
    }
  }
}
