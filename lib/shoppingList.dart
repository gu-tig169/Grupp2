import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:recipe/models/ingredientsModel.dart';
import 'package:recipe/models/model.dart';

class ShoppingList extends StatelessWidget {
  final List<Ingredient> shoppingList;
  ShoppingList(this.shoppingList);

  Widget build(BuildContext context) {
    return GroupedListView<dynamic, String>(
        elements: shoppingList,
        groupBy: (ingredient) {
          return ingredient.aisle;
        },
        groupSeparatorBuilder: (String aisle) => GroupSeparator(aisle: aisle),
        itemBuilder: (context, ingredient) =>
            _groceryItem(context, ingredient));
  }

  Widget _groceryItem(context, Ingredient ingredient) {
    return Card(
        child: Row(children: [
      Checkbox(
        value: ingredient.done,
        onChanged: (bool newValue) {
          var state = Provider.of<MyState>(context, listen: false);
          state.checkGrocery(ingredient, newValue);
        },
      ),
      Text(ingredient.name,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            decoration: (ingredient.done
                ? TextDecoration.lineThrough
                : TextDecoration.none),
          )),
      Spacer(),
      _counterIndicator(context, ingredient),
      IconButton(
          icon: Icon(Icons.cancel, color: Colors.grey[300]),
          onPressed: () {
            Provider.of<MyState>(context, listen: false)
                .removeGrocery(ingredient);
          }),
    ]));
  }

  Widget _counterIndicator(context, ingredient) {
    return Row(children: <Widget>[
      ingredient.counter != 1
          ? new IconButton(
              onPressed: () {
                Provider.of<MyState>(context, listen: false)
                    .decrement(ingredient, ingredient.counter);
              },
              icon: Icon(
                Icons.remove,
                color: Colors.black,
                size: 18.0,
              ))
          : Container(),
      Consumer<MyState>(
          builder: (context, state, child) => new Text(
                ('${ingredient.counter}'),
                style: TextStyle(fontSize: 18),
              )),
      Consumer<MyState>(
          builder: (context, state, child) => IconButton(
              onPressed: () {
                Provider.of<MyState>(context, listen: false)
                    .increment(ingredient, ingredient.counter);
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
                size: 18,
              ))),
    ]);
  }
}
  


class GroupSeparator extends StatelessWidget {
  final String aisle;
  GroupSeparator({this.aisle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
        child: Text(
          "${this.aisle}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
