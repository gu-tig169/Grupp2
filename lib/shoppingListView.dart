import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/grocerySearch.dart';
import 'package:recipe/main.dart';
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
            _popupMenu(context),
         /* PopupMenuButton(
                 onSelected: (value) {

                  Provider.of<MyState>(context, listen: false)
                      .setFilterList(value);
                },
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text('All'), value: 'All'),
                      PopupMenuItem(child: Text('Done'), value: 'Done'),
                      PopupMenuItem(child: Text('Undone'), value: 'Undone'),
                    ]),*/
                ],
                ),
          
      // backgroundColor: const Color(0xFFFFFFFF),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
        ShoppingList(filterList(state.shoppingList, state.filterBy)),
      ),
      
     // ShoppingList(),
     // floatingActionButton: _addNewGrocery(context),
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
    return FloatingActionButton(
        child: Icon(Icons.add, size: 56),
        backgroundColor: Colors.grey,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GrocerySearch()));
        });
  }
final List<String> filterBy = ['All', 'Done', 'Undone'];

Widget _popupMenu(context) {
  return PopupMenuButton<String>(
    onSelected: (value) {
       Provider.of<MyState>(context, listen: false).setFilterList(value);
      },
      itemBuilder: (BuildContext context) {
        return filterBy.map((filterBy) =>
          PopupMenuItem(value: filterBy, child: Text(filterBy))).toList();
      },
  
  );
}
 
  }

