import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/grocerySearch.dart';
import 'package:recipe/main.dart';
import 'package:recipe/shoppingList.dart';

class ShoppingListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF9AB39F),
          title: Text('Grocery list'),
          actions: <Widget>[
            //PopupMenuButton(),
            IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainView()));
                }),
          ]),
      // backgroundColor: const Color(0xFFFFFFFF),
      body: ShoppingList(),
      floatingActionButton: _addNewGrocery(context),
      
    );
  }

  List<ShoppingList> setFilter(list, filterList) {
    if (filterList == 'Done') {
      return list.where((item) => item.done == true).toList();
    } else if (filterList == 'Undone') {
      return list.where((item) => item.done == false).toList();
    }
    return list;
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
