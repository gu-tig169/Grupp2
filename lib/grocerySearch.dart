import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/circularProcessIndicator.dart';
import 'package:recipe/groceryList.dart';
import 'groceryListView.dart';
import 'package:recipe/models/model.dart';
import 'API.dart';

TextEditingController _controller = TextEditingController();

class GrocerySearch extends StatefulWidget {
  final RecipeInformation grocery;
  GrocerySearch({this.grocery});

  @override
  _GrocerySearchState createState() => _GrocerySearchState();
}

class _GrocerySearchState extends State<GrocerySearch> {
  var grocery;

  void _getGroceries(String query) async {
    var result = await API.getGroceries(query);
    setState(() {
      grocery = result;
    });
  }

  initState() {
    super.initState();
    _getGroceries("");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
          backgroundColor: const Color(0xFF9AB39F),
          title: Text('Search groceries'),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Row(children: <Widget>[
                _searchField(),
                _searchButton(),
              ]))),
      body: grocery == null
          ? Container(child: CircularProgressIndicatorApp())
          : _resultList(),
    );
  }

  Widget _searchField() {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: TextFormField(
                onChanged: (String text) {
                  _getGroceries(_controller.text);
                },
                controller: _controller,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    border: InputBorder.none,
                    hintText: 'Search groceries',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                      },
                    )))));
  }

  Widget _searchButton() {
    return IconButton(
        icon: Icon(Icons.search, color: Colors.white),
        onPressed: () {
          _getGroceries(_controller.text);
          //tar text från TextFormField och skickar som query med _controller
        });
  }

  Widget _resultList() {
    var results = grocery.ingredient;

    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Card(
                      child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: ListTile(
                            title: Text(results[index].name,
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            trailing: IconButton(
                                icon: Icon(Icons.add),
                                color: Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                GroceryList()));
                                  });
                                }),
                          )))));
        });
  }
}
