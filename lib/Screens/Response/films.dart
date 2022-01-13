import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Film {
  final String id;
  final String title;
  final String description;
  final double date;
  final String imageUrl;

  Film({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.date,
    @required this.imageUrl,
  });
}

class Products with ChangeNotifier {
  List<Film> filmsList = [];

  Future<void> fetchData() async {
    const url = "https://filmood-c8c12-default-rtdb.firebaseio.com/product.json";
    try {
      final http.Response res = await http.get(url);
      final extractedData = json.decode(res.body) as Map<String, dynamic>;
      extractedData.forEach((prodId, prodData) {
        final prodIndex =
            filmsList.indexWhere((element) => element.id == prodId);
        if (prodIndex >= 0) {
          filmsList[prodIndex] = Film(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            date: prodData['price'],
            imageUrl: prodData['imageUrl'],
          );
        } else {
          filmsList.add(Film(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            date: prodData['date'],
            imageUrl: prodData['imageUrl'],
          ));
        }
      });

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateData(String id) async {
    final url = "https://filmood-c8c12-default-rtdb.firebaseio.com/product/$id.json";

    final prodIndex = filmsList.indexWhere((element) => element.id == id);
    if (prodIndex >= 0) {
      await http.patch(url,
          body: json.encode({
            "title": "new title 4",
            "description": "new description 2",
            "date": 2020,
            "imageUrl":
                "https://cdn.pixabay.com/photo/2015/06/19/21/24/the-road-815297__340.jpg",
          }));

      filmsList[prodIndex] = Film(
        id: id,
        title: "new title 4",
        description: "new description 2",
        date: 199.8,
        imageUrl:
            "https://cdn.pixabay.com/photo/2015/06/19/21/24/the-road-815297__340.jpg",
      );

      notifyListeners();
    } else {
      print("...");
    }
  }

  Future<void> add(
      {String id,
      String title,
      String description,
      double price,
      String imageUrl}) async {
    const url = "https://filmood-c8c12-default-rtdb.firebaseio.com/product.json";
    try {
      http.Response res = await http.post(url,
          body: json.encode({
            "title": title,
            "description": description,
            "price": price,
            "imageUrl": imageUrl,
          }));
      print(json.decode(res.body));

      filmsList.add(Film(
        id: json.decode(res.body)['name'],
        title: title,
        description: description,
        date: price,
        imageUrl: imageUrl,
      ));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> delete(String id) async {
    final url = "https://filmood-c8c12-default-rtdb.firebaseio.com/product/$id.json";

    final prodIndex = filmsList.indexWhere((element) => element.id == id);
    var prodItem = filmsList[prodIndex];
    filmsList.removeAt(prodIndex);
    notifyListeners();

    var res = await http.delete(url);
    if (res.statusCode >= 400) {
      filmsList.insert(prodIndex, prodItem);
      notifyListeners();
      print("Could not deleted item");
    } else {
      prodItem = null;
      print("Item deleted");
    }
  }
}
