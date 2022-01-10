import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:new_app/Screens/Questions/question3.dart';
import 'package:new_app/Screens/Questions/question5.dart';
import 'package:new_app/main.dart';

class Question4 extends StatefulWidget {
  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question4> {
  String _selected;
  Void SelectScreen(BuildContext ctx, int n) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      if (n == 1) {
        return Question3();
      } else {
        return Question5();
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: b,
      appBar: AppBar(
        backgroundColor: b,
      ),
      body: Container(
        //alignment: Alignment.center,
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
              margin: EdgeInsets.fromLTRB(50, 50, 50, 0),
            ),
            SizedBox(height: 40.0),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Si on vous demande de sauter,\n combien de fois vous etes prete à sauter?",
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
                child: Column(
              children: [
                /*Text(
                  'Selectionner intervalle',
                  style: TextStyle(color: Colors.white),
                ),*/
                DropdownButton(
                  hint: Text(
                    "Selectionner un nombre",
                    style: TextStyle(color: Colors.white),
                  ),
                  value: _selected,
                  items: [
                    DropdownMenuItem(
                      child: Text("0 fois"),
                      value: "0 ",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "1 fois",
                      ),
                      value: "1",
                    ),
                    DropdownMenuItem(
                      child: Text("2 fois"),
                      value: "2",
                    ),
                    DropdownMenuItem(
                      child: Text("3 fois"),
                      value: "3",
                    ),
                    DropdownMenuItem(
                      child: Text("4 fois"),
                      value: "4",
                    ),
                  ],
                  onChanged: (newval) {
                    setState(() {
                      _selected = newval;
                    });
                  },
                )
              ],
            )),
            SizedBox(
              height: 100,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      SelectScreen(context, 1);
                    },
                    child: Text("Precedent"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[700]),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      SelectScreen(context, 2);
                    },
                    child: Text("Suivant"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[700]),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
