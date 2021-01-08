import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/models/model.dart';
import 'package:recipe/recipeSearch.dart';
import 'package:recipe/shoppingListView.dart';
import 'grocerySearch.dart';

void main() {
  var state = MyState();
  // state.getShoppingList();

  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/backgroundpicture.jpg'),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.menu_book_outlined,
                    color: Colors.red.withOpacity(0.6),
                    size: 200,
                  ),
                  padding: EdgeInsets.only(bottom: 50),
                ),
                _searchRecipiesButton(context),
                Container(
                  height: 30,
                  width: 50,
                ),
                _groceryList(context),
                Container(
                  height: 30,
                  width: 50,
                ),
                _addGroceries(context)
              ],
            )));
  }

  Widget _searchRecipiesButton(context) {
    return Container(
        height: 70,
        width: 300,
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              ),
          color: const Color(0xFF9AB39F).withOpacity(0.7),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RecipeSearch()));
          },
          child: Text('SEARCH FOR RECIPES',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        ));
  }

  Widget _groceryList(context) {
    return Container(
        height: 70,
        width: 300,
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
             ),
          color: const Color(0xFF9AB39F).withOpacity(0.7),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ShoppingListView()));
          },
          child: Text('VIEW SHOPPING LIST',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        ));
  }

  Widget _addGroceries(context) {
    return Container(
        height: 70,
        width: 300,
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
          ),
          color: const Color(0xFF9AB39F).withOpacity(0.7),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GrocerySearch()));
          },
          child: Text('SEARCH GROCERIES',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        ));
  }
}
