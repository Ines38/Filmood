import 'package:flutter/material.dart';
import 'package:new_app/Screens/Authenticat/Authenticate.dart';
import 'package:new_app/Screens/Authenticat/identification.dart';
import 'package:new_app/Screens/Authenticat/inscription.dart';
import 'package:new_app/Screens/Home/homepage.dart';
import 'package:new_app/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Homepage();
    }
  }
}
