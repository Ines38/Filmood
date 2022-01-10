import 'package:flutter/material.dart';
import 'package:new_app/Screens/Questions/question4.dart';
import 'package:new_app/Screens/Response/resultat.dart';
import 'package:new_app/main.dart';

class Question5 extends StatefulWidget {
  @override
  _Question5State createState() => _Question5State();
}

class _Question5State extends State<Question5> {
  String _selected;
  void Selectscreen(BuildContext ctx, int n) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      if (n == 1) {
        return Question4();
      } else
        return Resultat();
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
                "Maintenant entrelacer vos mains svp, et nous disez quelle pouce est sur l’autre?\n",
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
                  value: _selected,
                  items: [
                    DropdownMenuItem(
                      child: Text("droite sur gauche"),
                      value: "droite",
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "gauche sur droite",
                      ),
                      value: "gauche",
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
                      Selectscreen(context, 1);
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
                      Selectscreen(context, 2);
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
