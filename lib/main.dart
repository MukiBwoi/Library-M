import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Service/auth.dart';
import 'package:new_app/models/user.dart';
import 'package:provider/provider.dart';
import 'UI/Intropage/Intro.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LMS',
        theme: ThemeData(
            textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
            primarySwatch: Colors.orange),
        home: IntroPage(),
      ),
    );
  }
}
