import 'package:flutter/material.dart';
import 'package:new_app/Screens/Authenticat/inscription.dart';
import 'package:new_app/Services/auth.dart';
import 'package:new_app/main.dart';

/*import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
*/
class identify extends StatefulWidget {
  final Function toggleView;
  identify({this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _identifystate();
  }
}

class _identifystate extends State<identify> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String error = 'ERROR';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: b,
      appBar: AppBar(
        backgroundColor: b,
      ),
      body: Center(
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
              //margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
            ),
            SizedBox(height: 40),
            Form(
              key: _formkey,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 280,
                    height: 260,
                    color: Colors.grey[700],
                    child: Column(
                      children: [
                        Container(
                            height: 50,
                            margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'entrer un email' : null,
                              decoration: InputDecoration(
                                  labelText: "Adresse email",
                                  labelStyle: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  hintText: "Entrer email",
                                  hintStyle: TextStyle(
                                      fontSize: 11, color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  fillColor: Color.fromRGBO(182, 182, 182, 22),
                                  filled: true),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            )),
                        Container(
                            height: 50,
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
                            child: TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'verifier mot de passe' : null,
                              decoration: InputDecoration(
                                  labelText: "Mot de passe",
                                  labelStyle: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  hintText: "Entrer mot de passe",
                                  hintStyle: TextStyle(
                                      fontSize: 11, color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  fillColor: Color.fromRGBO(182, 182, 182, 22),
                                  filled: true),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            )),
                        Container(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formkey.currentState.validate()) {
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() =>
                                      error = 'please supply valid email');
                                }
                              }
                            },
                            child: Text("S'identifier"),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red[700]),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.fromLTRB(50, 5, 50, 5))),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 60, 10, 0),
              child: Text(
                "Vous n'avez pas de compte?",
                style: TextStyle(color: w, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                child: TextButton(
              onPressed: () {
                widget.toggleView();
              },
              child: Text("Inscrivez-vous"),
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all(w)),
            )),
            Container(
              child: Text(
                error,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )),
      ),
    );
  }
}
