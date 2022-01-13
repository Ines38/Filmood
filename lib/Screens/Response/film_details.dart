

import 'package:flutter/material.dart';
import 'package:new_app/Screens/Response/films.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<Products>(context, listen: false)
        .fetchData()
        .then((_) => _isLoading = false)
        .catchError((onError) => print(onError));

    super.initState();
  }

  Widget detailCard(id, tile, desc, price, imageUrl) {
    return Builder(
      builder: (innerContext) => FlatButton(
        onPressed: () {
          print(id);
          Navigator.push(
            innerContext,
            MaterialPageRoute(builder: (_) => ProductDetails(id)),
          ).then(
              (id) => Provider.of<Products>(context, listen: false).delete(id));
        },
        child: Column(
          children: [
            SizedBox(height: 5),
            Card(
              elevation: 10,
              color: Color.fromRGBO(115, 138, 119, 1),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 130,
                      child: Hero(
                        tag: id,
                        child: Image.network(imageUrl, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(
                          tile,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Divider(color: Colors.white),
                        Container(
                          width: 200,
                          child: Text(
                            desc,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.justify,
                            maxLines: 3,
                          ),
                        ),
                        Divider(color: Colors.white),
                        Text(
                          "\$$price",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        SizedBox(height: 13),
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Film> prodList =
        Provider.of<Products>(context, listen: true).filmsList;

    return Scaffold(
      appBar: AppBar(title: Text('My Products')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : (prodList.isEmpty
              ? Center(
                  child: Text('No Products Added.',
                      style: TextStyle(fontSize: 22)))
              : RefreshIndicator(
                  onRefresh: () async =>
                      await Provider.of<Products>(context, listen: false)
                          .fetchData(),
                  child: ListView(
                    children: prodList
                        .map(
                          (item) => detailCard(item.id, item.title,
                              item.description, item.date, item.imageUrl),
                        )
                        .toList(),
                  ),
                )),
      floatingActionButton: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).primaryColor,
        ),
        child: FlatButton.icon(
          label: Text("Add Product",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
          icon: Icon(Icons.add),
          onPressed: () {}/*=> Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddProduct()))*/,
        ),
      ),
    );
  }
}
class ProductDetails extends StatelessWidget {
  final String id;

  ProductDetails(this.id);

  @override
  Widget build(BuildContext context) {
    List<Film> prodList = Provider.of<Products>(context, listen: true).filmsList;

    var filteredItem = prodList.firstWhere((element) => element.id == id, orElse: () => null);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: filteredItem == null ? null : Text(filteredItem.title),
          actions: [
            FlatButton(onPressed: ()=> Provider.of<Products>(context, listen: false).updateData(id), child: Text("Update Data"))
          ],
      ),
      body: filteredItem == null
          ? null
          : ListView(
              children: [
                SizedBox(height: 10),
                buildContainer(filteredItem.imageUrl, filteredItem.id),
                SizedBox(height: 10),
                buildCard(filteredItem.title, filteredItem.description,
                    filteredItem.date),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.pop(context, filteredItem.id);
        },
        child: Icon(Icons.delete, color: Colors.black),
      ),
    );
  }

  Container buildContainer(String image, String id) {
    return Container(
      width: double.infinity,
      child: Center(
        child: Hero(
          tag: id,
          child: Image.network(image),
        ),
      ),
    );
  }

  Card buildCard(String title, String desc, double price) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(7),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.black),
            Text(desc,
                style: TextStyle(fontSize: 16), textAlign: TextAlign.justify),
            Divider(color: Colors.black),
            Text(
              "\$$price",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}