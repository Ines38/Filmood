import 'package:flutter/material.dart';
import 'package:new_app/Screens/Authenticat/identification.dart';
import 'package:new_app/Screens/Home/homepage.dart';
import 'package:new_app/Services/auth.dart';
import 'package:new_app/main.dart';

class inscrit extends StatefulWidget {
  final Function toggleView;
  inscrit({this.toggleView});

  @override
  State<StatefulWidget> createState() => inscritstate();
}

class inscritstate extends State<inscrit> {
  final AuthService _auth = AuthService();

  String email = '';
  String name = '';
  String password = '';
  final _formkey = GlobalKey<FormState>();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: b,
      appBar: AppBar(
        backgroundColor: b,
        actions: <Widget>[
          FlatButton.icon(
              textColor: Colors.white,
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('sign in'))
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
                margin: EdgeInsets.fromLTRB(50, 20, 50, 0),
              ),
              SizedBox(height: 40),
              Form(
                key: _formkey,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 280,
                      height: 400,
                      color: Colors.grey[700],
                      child: Column(
                        children: [
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
                              child: TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? 'entrer un nom' : null,
                                decoration: InputDecoration(
                                    labelText: "Nom utilisateur",
                                    labelStyle: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                    hintText: "Entrer votre nom",
                                    hintStyle: TextStyle(
                                        fontSize: 11, color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    fillColor:
                                        Color.fromRGBO(182, 182, 182, 22),
                                    filled: true),
                                keyboardType: TextInputType.text,
                                onChanged: (val) {
                                  setState(() => name = val);
                                },
                              )),
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: TextFormField(
                                validator: (val) => val.length < 6
                                    ? 'entrer mot de passe plus de 6 characteres'
                                    : null,
                                decoration: InputDecoration(
                                    labelText: "Mot de passe",
                                    labelStyle: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    fillColor:
                                        Color.fromRGBO(182, 182, 182, 22),
                                    filled: true),
                                keyboardType: TextInputType.visiblePassword,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                                obscureText: true,
                              )),
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: TextFormField(
                                validator: (val) => val.isEmpty
                                    ? 'verifier mot de passe'
                                    : null,
                                decoration: InputDecoration(
                                    labelText: "Mot de passe(verification)",
                                    labelStyle: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                    //hintText: "Enter password",
                                    //hintStyle: TextStyle(fontSize: 11, color: Colors.black54),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    fillColor:
                                        Color.fromRGBO(182, 182, 182, 22),
                                    filled: true),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              )),
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
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
                                    fillColor:
                                        Color.fromRGBO(182, 182, 182, 22),
                                    filled: true),
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                //obscureText: true,
                              )),
                          Container(
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formkey.currentState.validate()) {
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);

                                  if (result == null) {
                                    setState(() =>
                                        error = 'please supply valid email');
                                  } else {
                                    return Homepage();
                                  }
                                }
                              },
                              child: Text("S'inscrire"),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.red[700]),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.fromLTRB(50, 5, 50, 5))),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              /*Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 280,
                    height: 400,
                    color: Colors.grey[700],
                    child: Column(
                      key: _formkey,
                      children: [
                        Container(
                            height: 50,
                            margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Nom utilisateur",
                                  labelStyle: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  hintText: "Entrer votre nom",
                                  hintStyle: TextStyle(
                                      fontSize: 11, color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  fillColor: Color.fromRGBO(182, 182, 182, 22),
                                  filled: true),
                              keyboardType: TextInputType.text,
                              onChanged: (val) {
                                setState(() => name = val);
                              },
                            )),
                        Container(
                            height: 50,
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Mot de passe",
                                  labelStyle: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  fillColor: Color.fromRGBO(182, 182, 182, 22),
                                  filled: true),
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                              obscureText: true,
                            )),
                        Container(
                            height: 50,
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Mot de passe(verification)",
                                  labelStyle: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                  //hintText: "Enter password",
                                  //hintStyle: TextStyle(fontSize: 11, color: Colors.black54),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  fillColor: Color.fromRGBO(182, 182, 182, 22),
                                  filled: true),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            )),
                        Container(
                            height: 50,
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
                            child: TextField(
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
                              //obscureText: true,
                            )),
                        Container(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formkey.currentState.validate()) {
                                print(email);
                              }
                            },
                            child: Text("S'inscrire"),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red[700]),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.fromLTRB(50, 5, 50, 5))),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
