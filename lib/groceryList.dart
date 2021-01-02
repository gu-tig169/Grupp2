import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/circularProcessIndicator.dart';
import 'package:recipe/models/model.dart';
import 'grocerySearch.dart';
import 'main.dart';

class GroceryList extends StatelessWidget {
  final RecipeInformation recipeInformation;
  final RecipeInformation grocery;

  GroceryList({this.recipeInformation, this.grocery});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        //PopupMenuButton(),
        IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainView()));
            }),
      ]),
      // backgroundColor: const Color(0xFFFFFFFF),
      body: recipeInformation == null
          ? Container(child: CircularProgressIndicatorApp())
          : _groceryList(context),
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

  Widget _groceryList(context) {
    var ingredients = recipeInformation.ingredient;

    var allIngredients = [
      ...recipeInformation.ingredient,
      ...grocery.ingredient
    ];

    return Consumer<MyState>(
        builder: (context, state, child) => ListView.builder(
            itemCount: allIngredients.length,
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
                              title: Text(allIngredients[index].name,
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                              leading: Checkbox(
                                value: false,
                                onChanged: (bool value) {},
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  Provider.of<MyState>(context, listen: false)
                                      .removeGrocery(index);
                                  //(list[index].ingredient);
                                },
                                //list[index].ingredient
                              )))));
            }));
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
