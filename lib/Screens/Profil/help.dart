import 'package:flutter/material.dart';
import 'package:new_app/Screens/Profil/profil.dart';
import 'package:new_app/main.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: b,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
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
                  width: 300,
                  color: Colors.grey[700],
                  child: Column(
                    children: [
                      Text(
                        "HELP",
                        style: TextStyle(color: w, fontSize: 30),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Explorez les films selon votre humeur! Découvrez la toute nouvelle expérience dédiée aux passionnés de film: un moteur de recherche intelligent, des expériences exclusives, des contenus inédits et personnalisés",
                          style: TextStyle(
                            color: w,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Comment se connecter?",
                          style: TextStyle(color: w, fontSize: 25),
                        ),
                      ),
                      Container(
                        child: Text(
                          "1-Remplissez le champ de formulaire\n 2-Cliquez sur s'identifier\n",
                          style: TextStyle(
                            color: w,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Si vous n'avez pas de compte, cliquez sur inscrivez vous ",
                          style: TextStyle(color: w, fontSize: 18),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Remplissez le formulaire et cliquez sur s'inscrire\n Vous serez alors automatiquement redirigé(e) sur l'application filmood et pouvez commencer votre expérience personnalisée !",
                          style: TextStyle(color: w, fontSize: 18),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Pourquoi me demande-t-on mes coordonnées ?",
                          style: TextStyle(color: w, fontSize: 25),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Les coordonnées sont nécessaires dans le cadre du programme Privilèges, notamment pour l’envoi de Privilèges qui ne seraient pas dématérialisés. Vos coordonnées doivent donc être complétées et mises à jour dès qu’un changement intervient. Pour cela il vous suffit de vous rendre sur votre espace personnel et de cliquer sur « Modifier votre profil ».",
                          style: TextStyle(color: w, fontSize: 18),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Comment puis-je modifier mon profil ?",
                          style: TextStyle(color: w, fontSize: 25),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Vous pouvez modifier vos informations personnelles en cliquant sur « Modifier votre profil » depuis votre espace personnel. Une fois vos modifications terminées, cliquez sur «Enegistrer».",
                          style: TextStyle(color: w, fontSize: 18),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Comment fonctionne le Filmood ?",
                          style: TextStyle(color: w, fontSize: 25),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          "Pour commencer, il vous suffit de cliquer sur « Cliquant ici » dans la page Home pour accéder à la première étape. Pour passer à l’étape suivante, cliquez sur « Suivant ». Sur la page de résultat, dans le cas où vous êtes connecté(e), vous verrez apparaître un pourcentage de pertinence pour chacun des films affichés. Ce pourcentage est calculé par rapport aux critères sélectionnés lors de votre choix : plus le pourcentage est élevé, plus le film correspond aux critères sélectionnés. Sur la page de résultat, vous avez également la possibilité d’ajouter un film à votre liste de déjà vus et à votre liste d’envies.",
                          style: TextStyle(color: w, fontSize: 18),
                        ),
                      ),
                    ],
                  )),
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
