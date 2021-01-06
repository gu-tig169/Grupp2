import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:recipe/models/ingredientsModel.dart';
import 'package:recipe/models/model.dart';

class ShoppingList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<MyState>(
        builder: (context, state, child) => GroupedListView<dynamic, String>(
              elements: state.shoppingList,
              groupBy: (ingredient) {
                return ingredient.aisle;
              },
              groupSeparatorBuilder: (String aisle) =>
                  GroupSeparator(aisle: aisle),
              itemBuilder: (context, index) =>
                  _groceryItem(context, state.shoppingList[index], index),

              /*ListView.builder(
              itemBuilder: (context, index) =>
                  _groceryItem(context, state.shoppingList[index], index),
              itemCount: state.shoppingList.length,
            ));*/
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
