import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/models/model.dart';
import 'package:recipe/recipeSearch.dart';
import 'package:recipe/shoppingListView.dart';
import 'grocerySearch.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  var state = MyState();

  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: MyApp(),
  ));
}

//test
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        )
      ),
    //  theme: ThemeData(fontFamily: 'OpenSands'),
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //  backgroundColor: (Colors.grey
        //  ),

        body: Container(
            //Lagt till nedan (fram till child) för att kunna använda bakgrundsbild
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/testbild.jpg'),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
              side: BorderSide(color: Colors.white)),
          color: Colors.white.withOpacity(0.8),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RecipeSearch()));
          },
          child: Text('Search recipies',
              style: TextStyle(
                fontSize: 20,
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
              side: BorderSide(color: Colors.white)),
          color: Colors.white.withOpacity(0.8),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ShoppingListView()));
          },
          child: Text('See grocery list',
              style: TextStyle(
                fontSize: 20,
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
              side: BorderSide(color: Colors.white)),
          color: Colors.white.withOpacity(0.8),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GrocerySearch()));
          },
          child: Text('Search groceries',
              style: TextStyle(
                fontSize: 20,
              )),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        ));
  }
}
