import 'package:new_app/Screens/Home/homepage.dart';
import 'package:new_app/Screens/Profil/change.dart';
import 'package:new_app/Screens/Profil/help.dart';
import 'package:new_app/Screens/Profil/historique.dart';
import 'package:new_app/main.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
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
                //color: Colors.blue,
                margin: EdgeInsets.fromLTRB(50, 10, 50, 0),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 250,
                height: 500,
                color: Colors.grey[700],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person),
                          TextButton(
                              onPressed: () => Navigator.of(context)
                                      .pushReplacement(
                                          MaterialPageRoute(builder: (_) {
                                    return change();
                                  })),
                              child: Column(
                                children: [
                                  Text(
                                    "PROFIL",
                                    style: TextStyle(color: w, fontSize: 20),
                                  ),
                                  Text(
                                    "nom utilisateur",
                                    style: TextStyle(color: w),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Parametres:",
                        style: TextStyle(color: w, fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Text(
                            "Dark-mode",
                            style: TextStyle(color: w, fontSize: 20),
                          ),
                          IconButton(
                            icon: Icon(Icons.circle),
                            onPressed: () => setState(() {
                              b = Colors.black;
                              w = Colors.white;
                            }),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Text(
                            "Light-mode",
                            style: TextStyle(color: w, fontSize: 20),
                          ),
                          IconButton(
                            icon: Icon(Icons.circle),
                            onPressed: () => setState(() {
                              b = Colors.white;
                              w = Colors.black;
                            }),
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Langue:",
                        style: TextStyle(color: w, fontSize: 20),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Français",
                          style: TextStyle(color: w, fontSize: 20),
                        )),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Anglais",
                        style: TextStyle(color: w, fontSize: 20),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Arabe",
                        style: TextStyle(color: w, fontSize: 20),
                      ),
                    ),
                    OutlineButton(
                      onPressed: () => Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (_) {
                        return Historique();
                      })),
                      child: Text(
                        "Historique",
                        style: TextStyle(color: w, fontSize: 22),
                      ),
                    ),
                    OutlineButton(
                      onPressed: () => Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (_) {
                        return Help();
                      })),
                      child: Text(
                        "Help",
                        style: TextStyle(color: w, fontSize: 22),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                //alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[800]),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(50, 2, 50, 2))),
                  onPressed: () => Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return Homepage();
                  })),
                  child: Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
