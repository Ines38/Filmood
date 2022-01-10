//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_app/Screens/Profil/profil.dart';
import 'package:new_app/main.dart';
import 'package:image_picker/image_picker.dart';

class change extends StatefulWidget {
  @override
  _changeState createState() => _changeState();
}

class _changeState extends State<change> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                height: 420,
                color: Colors.grey[700],
                child: Column(
                  children: [
                    _image == null
                        ? Image.asset("images/image2.png")
                        : Image.file(_image),
                    OutlineButton(
                      onPressed: getImage,
                      child: Text(
                        "Changer la photo",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      textColor: w,
                    ),
                    Text(
                      "modifier le nom utilisateur",
                      style: TextStyle(color: w, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: 230,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: "Nom utilisateur",
                              labelStyle: TextStyle(fontSize: 12, color: w),
                              hintText: "Changer votre nom",
                              hintStyle: TextStyle(fontSize: 11, color: w),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.white,
                              )),
                              fillColor: Color.fromRGBO(182, 182, 182, 22),
                              filled: true),
                          keyboardType: TextInputType.text,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red[900])),
                        child: Text(
                          "Enregistrer",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profil()),
                  );
                },
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
