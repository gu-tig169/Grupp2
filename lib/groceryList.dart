import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/models/model.dart';
import 'API.dart';
import 'grocerySearch.dart';

class GroceryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFE4E1),
        appBar: AppBar(backgroundColor: const Color(0xFFFFE4E1), actions: [
          PopupMenuButton(
              onSelected: (value) {
                //  Provider.of<MyState>(context, listen: false).setFilter(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('Visa alla'), value: 'Visa alla'),
                    PopupMenuItem(child: Text('Klar'), value: 'Klar'),
                    PopupMenuItem(child: Text('Inte klar'), value: 'Inte klar'),
                  ]),
        ]),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            
          ]
          )
          ),
          floatingActionButton: _addGrocery(context),
          );
  }


  List<GroceryList> setFilter(list, filterList) {
    if (filterList == 'Klar') {
      return list.where((item) => item.done == true).toList();
    } else if (filterList == 'Inte klar') {
      return list.where((item) => item.done == false).toList();
    }
    return list;
  }
   Widget _addGrocery (context) {
      return FloatingActionButton(
        child: Icon(Icons.add,
        size:56),
        backgroundColor: Colors.grey,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => GrocerySearch()));
});
   }
}