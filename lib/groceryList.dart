import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/models/model.dart';
import 'grocerySearch.dart';

class GroceryList extends StatefulWidget {
  final RecipeInformation recipeInformation;
  GroceryList({this.recipeInformation});

  @override
  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
          backgroundColor: const Color(0xFF9AB39F),
          title: Text('Grocery list'),
          actions: [
            _popUpMenuButton(),
          ]),
      body: widget.recipeInformation == null ? Container() : _groceryList(),
      floatingActionButton: _addGrocery(context),
    );
  }

  List<GroceryList> setFilter(list, filterList) {
    if (filterList == 'Done') {
      return list.where((item) => item.done == true).toList();
    } else if (filterList == 'Undone') {
      return list.where((item) => item.done == false).toList();
    }
    return list;
  }

  Widget _addGrocery(context) {
    return FloatingActionButton(
        child: Icon(Icons.add, size: 56),
        backgroundColor: Colors.grey,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GrocerySearch()));
        });
  }

  Widget _groceryList(context) {
    var ingredients = recipeInformation.ingredient;

    return ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Card(
                  child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ListTile(
                        title: Text(ingredients[index].name,
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        leading: Checkbox(
                          value: false,
                          onChanged: (bool value) {},
                        ),
                        trailing: Icon(Icons.cancel),
                      ))));
        });

    Widget _groceryList() {
      var ingredients = widget.recipeInformation.ingredient;

      return Container(
          child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    ingredients[index].name,
                  ),
                  leading: Checkbox(value: false, onChanged: (bool value) {}),
                  trailing: Icon(Icons.cancel),
                );
              }));
    }

    Widget _popUpMenuButton() {
      return PopupMenuButton(
          onSelected: (value) {
            //  Provider.of<MyState>(context, listen: false).setFilter(value);
          },
          itemBuilder: (context) => [
                PopupMenuItem(child: Text('All'), value: 'All'),
                PopupMenuItem(child: Text('Done'), value: 'Done'),
                PopupMenuItem(child: Text('Undone'), value: 'Undone'),
              ]);
    }
  }
}
