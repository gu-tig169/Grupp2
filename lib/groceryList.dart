import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/models/model.dart';

class MyState extends ChangeNotifier {
  var _list = [];

  List<dynamic> get list => _list;

  void addGrocery(RecipeInformation grocery) {
    _list.add(grocery);
    notifyListeners();
  }
}

class GroceryList extends StatefulWidget {
  final RecipeInformation recipeInformation;
  final RecipeInformation grocery;

  GroceryList({this.recipeInformation, this.grocery});

  @override
  _GroceryListState createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  Widget build(BuildContext context) {
    //var ingredients = widget.recipeInformation.ingredient;
    var groceries = widget.grocery.ingredient;

    /* var allIngredients = [
      ...widget.recipeInformation.ingredient,
      ...widget.grocery.ingredient
    ];*/

    return ListView.builder(
        itemCount: groceries.length,
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Card(
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                          title: Text(groceries[index].name,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                          leading: Checkbox(
                            value: false,
                            onChanged: (bool value) {},
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              /*   Provider.of<MyState>(context, listen: false)
                                      .removeGrocery(index);
                                  //(list[index].ingredient);*/
                            },
                            //list[index].ingredient
                          )))));
        });
  }
}
