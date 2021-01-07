import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/models/ingredientsModel.dart';
import 'package:recipe/models/model.dart';

class ShoppingList extends StatefulWidget {
  final List<Ingredient> shoppingList;
  ShoppingList(this.shoppingList);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          _groceryItem(context, widget.shoppingList[index], index),
      itemCount: widget.shoppingList.length,
    );
  }

  Widget _groceryItem(context, Ingredient ingredient, index) {
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
      _counterIndicator(context, index, ingredient),
      IconButton(
          icon: Icon(Icons.cancel, color: Colors.grey[300]),
          onPressed: () {
            Provider.of<MyState>(context, listen: false)
                .removeGrocery(ingredient);
          }),
    ]));
  }

  Widget _counterIndicator(context, index, ingredient) {
    var counter = ingredient.counter;
    return Row(children: <Widget>[
      Consumer<MyState>(
          builder: (context, state, child) => IconButton(
              onPressed: () {
                Provider.of<MyState>(context, listen: false)
                    .decrement(ingredient, ingredient.counter);
              },
              icon: Icon(
                Icons.remove,
                color: Colors.black,
                size: 18,
              ))),
      Consumer<MyState>(
          builder: (context, state, child) => Text(
                ('$counter'),
                style: TextStyle(fontSize: 18),
              )),
      new IconButton(
          onPressed: () {
            Provider.of<MyState>(context, listen: false)
                .increment(ingredient, ingredient.counter);
          },
          icon: Icon(
            Icons.add,
            color: Colors.black,
            size: 18.0,
          ))
    ]);
  }
}
