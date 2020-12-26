import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/models/ingredientsModel.dart';
import 'API.dart';

TextEditingController _controller = TextEditingController();

class GrocerySearch extends StatefulWidget {
  final List<Ingredient> list;
  GrocerySearch({this.list});

  @override
  _GrocerySearchState createState() => _GrocerySearchState();
}

class _GrocerySearchState extends State<GrocerySearch> {
  var groceries = new List<Ingredient>();

  _getGrocery(String query) async {
    var grocery = await API.getGrocery(query);
    setState(() {
      groceries = grocery;
    });
  }

  initState() {
    super.initState();
    _getGrocery("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFE4E1),
        appBar: AppBar(
            backgroundColor: const Color(0xFFFFE4E1),
            title: Text('Sök varor'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: TextFormField(
                        onChanged: (String text) {
                          _getGrocery(_controller.text);
                        },
                        controller: _controller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15.0),
                          border: InputBorder.none,
                          hintText: 'Sök efter varor',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              //              _getGrocery(_controller.clear)
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      //     _getGrocery(_controller
                      //        .text); //tar text från TextFormField och skickar som query med _controller
                    },
                  ),
                ],
              ),
            )),
        body: ListView.builder(
            itemCount: groceries.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          groceries[index].ingredient,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ));
            }));
  }
}
