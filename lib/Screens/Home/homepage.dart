import 'package:flutter/material.dart';
import 'package:new_app/Screens/Authenticat/Authenticate.dart';
import 'package:new_app/Screens/Profil/profil.dart';
import 'package:new_app/Screens/Questions/question1.dart';
import 'package:new_app/Screens/wrapper.dart';
import 'package:new_app/Services/auth.dart';
import 'package:new_app/main.dart';

class Homepage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: b,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.person_outline),
          onPressed: () => Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) {
            return Profil();
          })),
          color: Colors.white,
        ),
        backgroundColor: b,
        actions: [
          FlatButton.icon(
              textColor: Colors.white,
              onPressed: () async {
                await _auth.signout();
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) {
                  return Authenticate();
                }));
              },
              icon: Icon(Icons.person),
              label: Text('sign out'))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              child: Text(
                "FILMOOD",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.red[700],
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                ),
              ),
              //color: Colors.blue,
              margin: EdgeInsets.fromLTRB(50, 10, 50, 0),
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(),
              child: Image.asset("images/image1.png"),
            ),
            SizedBox(height: 40.0),
            Container(
              child: Text(
                "Un film à voir?\n"
                "Ne cherchez plus quel bon film regarder ce soir, Filmood le trouve pour vous ! Cet outil de suggestion inédit déniche en quelques clics des idées de films selon votre humeur du moment."
                " Testez sans attendre en",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            ),
            Container(
              child: TextButton(
                child: Text("cliquant içi"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Question1()),
                  );
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(w),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
