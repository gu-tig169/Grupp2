import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/models/model.dart';
import 'buildPopUpDialog.dart';


class GrocerySearchList extends StatelessWidget {
  final RecipeInformation grocery;
  GrocerySearchList({this.grocery});

  Widget build(BuildContext context) {
    var results = grocery.ingredients;

    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Card(
                      child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: ListTile(
                            title: Text(results[index].name,
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                            trailing: IconButton(
                                icon: Icon(Icons.add),
                                color: Colors.grey,
                                onPressed: () {
                                  var state = Provider.of<MyState>(context,
                                      listen: false);
                                  state.addGrocery(grocery.ingredients[index]);
                                  showDialog(context: context,
          builder: (BuildContext context) => 
          BuildPopupDialog(),
          );
                                }),
                          )))));
        });
  }
}
    


