import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/models/ingredientsModel.dart';
import 'package:recipe/models/model.dart';

import 'grocerySearch.dart';

class GroceryList extends StatelessWidget {
  final RecipeInformation recipeInformation;
  final Ingredient grocery;
  GroceryList({this.recipeInformation, this.grocery});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(backgroundColor: const Color(0xFF9AB39F), actions: [
        _popUpMenuButton(),
      ]),
      body: recipeInformation == null ? Container() : _groceryList(context),
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
    var groceries = grocery.name;

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
                      padding: EdgeInsets.all(10.0),
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
