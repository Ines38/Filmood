//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:new_app/Screens/Authenticat/Authenticate.dart';
import 'package:new_app/Screens/Home/homepage.dart';
import 'package:new_app/Screens/Authenticat/identification.dart';
import 'package:new_app/Screens/Authenticat/inscription.dart';
import 'package:new_app/Screens/Profil/profil.dart';
import 'package:new_app/Screens/Questions/question2.dart';
import 'package:new_app/Screens/Questions/question3.dart';
import 'package:new_app/Screens/Questions/question4.dart';
import 'package:new_app/Screens/Response/resultat.dart';
import 'package:new_app/Screens/wrapper.dart';
import 'package:new_app/models/user.dart';
import 'package:provider/provider.dart';
import 'Services/auth.dart';

void main() => runApp(MyApp());

Color w = Colors.white;
Color b = Colors.black;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FILMOOD',
        home: Wrapper(),
      ),
    );
  }
}
