import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:new_app/Screens/Home/homepage.dart';
import 'package:new_app/Screens/Questions/question2.dart';
import 'package:new_app/main.dart';

class Question1 extends StatefulWidget {
  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  String _selected;
  Void SelectScreen(BuildContext ctx, int n) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      if (n == 1) {
        return Homepage();
      } else
        return Question2();
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
                "Etes vous une femme ou un homme?\n",
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
                    "Selectionner le genre",
                    style: TextStyle(color: Colors.white),
                  ),
                  value: _selected,
                  items: [
                    DropdownMenuItem(
                      child: Text("Femme"),
                      value: "Femme",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Homme",
                      ),
                      value: "Homme",
                    ),
                    DropdownMenuItem(
                      child: Text(""),
                    )
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
                    child: Text("Home"),
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
