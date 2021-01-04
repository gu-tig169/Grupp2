import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/models/ingredientsModel.dart';
import 'package:recipe/models/model.dart';

class GroceryList extends StatefulWidget {
  final List<Ingredient> shoppingList;

  GroceryList({this.shoppingList});

  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          _groceryItem(context, widget.shoppingList[index], index),
      itemCount: widget.shoppingList.length,
    );
  }

  Widget _groceryItem(context, Ingredient ingredient, index) {
    return Consumer<MyState>(
        builder: (context, state, child) => ListTile(
            title: Text(ingredient.name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                )),
            leading: Checkbox(
              value: false,
              onChanged: (bool value) {},
            ),
            trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  /*   Provider.of<MyState>(context, listen: false)
                                      .removeGrocery(index);
                                  //(list[index].ingredient);*/
                })));
  }
}
