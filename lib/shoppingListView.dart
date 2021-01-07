import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/grocerySearch.dart';
import 'package:recipe/shoppingList.dart';

import 'models/ingredientsModel.dart';
import 'models/model.dart';

class ShoppingListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AB39F),
        title: Text('Shopping list'),
        actions: [
          _addNewGrocery(context),
          PopupMenuButton(
              onSelected: (value) {
                Provider.of<MyState>(context, listen: false)
                    .setFilterList(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('All'), value: 'All'),
                    PopupMenuItem(child: Text('Done'), value: 'Done'),
                    PopupMenuItem(child: Text('Undone'), value: 'Undone'),
                  ]),
        ],
      ),
      body: Consumer<MyState>(
          builder: (context, state, child) =>
              ShoppingList(filterList(state.shoppingList, state.filterBy))),
      //floatingActionButton: _addNewGrocery(context),
    );
  }

  List<Ingredient> filterList(shoppingList, filterBy) {
    if (filterBy == 'Done') {
      return shoppingList.where((item) => item.done == true).toList();
    } else if (filterBy == 'Undone') {
      return shoppingList.where((item) => item.done == false).toList();
    }
    return shoppingList;
  }

  Widget _addNewGrocery(context) {
    return IconButton(
        icon: Icon(
          Icons.add,
          size: 18,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GrocerySearch()));
        });
  }
}
