import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/models/ingredientsModel.dart';
import 'package:recipe/models/model.dart';

class ShoppingList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<MyState>(
        builder: (context, state, child) => ListView.builder(
              itemBuilder: (context, index) =>
                  _groceryItem(context, state.shoppingList[index], index),
              itemCount: state.shoppingList.length,
            ));
  }

  Widget _groceryItem(context, Ingredient ingredient, index) {
    return ListTile(
        title: Text(ingredient.name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            )),
        leading: Checkbox(
            value: false,
            onChanged: (bool newValue) {
              var state = Provider.of<MyState>(context, listen: false);
              state.checkGrocery(ingredient, newValue);
            }),
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<MyState>(context, listen: false).removeGrocery(index);
            }));
  }
}