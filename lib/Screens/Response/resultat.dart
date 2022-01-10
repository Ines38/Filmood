
import 'package:flutter/material.dart';
import 'package:new_app/main.dart';
import 'package:flutter/src/rendering/box.dart';

class Resultat extends StatefulWidget {
  @override
  _ResultatState createState() => _ResultatState();
}

class _ResultatState extends State<Resultat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: b,
      body: Container(
        //alignment: Alignment.center,
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
              SizedBox(height: 20.0),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "les films qui correspondent à vos critères \n",
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
                padding: EdgeInsets.only(top: 10),
                child: GridView(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          //Image.asset("images/image2.png"),

                          Text(
                            "the perfect date",
                            style: TextStyle(color: w),
                          )
                        ],
                      ),
                    ),
                    /*Container(
                    child: Column(
                      children: [
                        Image.asset("images/image2.png"),
                        SizedBox(height: 8,),
                        Text("the perfect date", style: TextStyle(color: w),)
                      ],
                    ),
                  )*/
                  ],
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80.0,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Choisir",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red[900])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
