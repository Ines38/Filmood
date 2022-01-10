import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_app/Screens/Profil/profil.dart';
import 'package:new_app/main.dart';

class Historique extends StatefulWidget {
  @override
  _HistoriqueState createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: b,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                margin: EdgeInsets.fromLTRB(50, 10, 50, 20),
              ),
              Container(
                width: 280,
                height: 400,
                color: Colors.grey[700],
                child: Column(
                  children: [
                    Text(
                      "Historique",
                      style: TextStyle(color: w, fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Film: nom de film",
                          style: TextStyle(color: w, fontSize: 20),
                        ),
                        Text(
                          "Note: la note de film",
                          style: TextStyle(color: w, fontSize: 20),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) {
                  return Profil();
                })),
                child: Text(
                  "Retour",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red[900])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
