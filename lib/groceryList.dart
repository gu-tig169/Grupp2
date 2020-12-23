import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/models/model.dart';
import 'API.dart';
import 'grocerySearch.dart';
import 'models/recipeModel.dart';

class GroceryList extends StatelessWidget {
  final RecipeInformation recipeIngredient;
  GroceryList(this.recipeIngredient);

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFE4E1),
        appBar: AppBar(backgroundColor: const Color(0xFFFFE4E1), actions: [
          PopupMenuButton(
              onSelected: (value) {
                //  Provider.of<MyState>(context, listen: false).setFilter(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('All'), value: 'All'),
                    PopupMenuItem(child: Text('Done'), value: 'Done'),
                    PopupMenuItem(child: Text('Undone'), value: 'Undone'),
                  ]),
        ]),
        body: 
        _groceryList(),
        /*ListView.builder(
            itemCount: groceries.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(.text),
              leading: Checkbox( 
                
              )
              );
            }
        */
        Center(
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
    if (filterList == 'Done') {
      return list.where((item) => item.done == true).toList();
    } else if (filterList == 'Undone') {
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
}
);
   }

   Widget _groceryList() {
     return Card(
       child: ListView.builder(
            itemCount: recipeIngredient.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(.text),
              leading: Checkbox( 
                
              )
              );
            },
            )
            );
   }
  }
