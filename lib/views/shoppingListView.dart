import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/Views/grocerySearchView.dart';
import 'package:recipe/lists/shoppingList.dart';
import '../models/ingredientsModel.dart';
import '../models/model.dart';

class ShoppingListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF9AB39F),
        title: Text('Shopping list'),
        actions: [
          _addNewGrocery(context),
          PopupMenuButton(
              icon: Icon(Icons.filter_alt_rounded),
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
    return Tooltip(
        message: 'Add new grocery',
        child: IconButton(
          icon: Icon(Icons.add, size: 30),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GrocerySearch()));
          },
        ));
  }
}
