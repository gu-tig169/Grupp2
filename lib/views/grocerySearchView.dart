import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/grocerySearchList.dart';
import 'package:recipe/models/model.dart';
import '../API/API.dart';

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
    _controller.clear();
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
                ]))),
        body: grocery == null
            ? Container()
            : GrocerySearchList(
                grocery: grocery,
              ));
  }

  Widget _searchField() {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 12.0, bottom: 8.0, right: 12.0),
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
}
