

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/recipeSearch.dart';
import './groceryList.dart';
import './favoriteView.dart';

void main () {
  
  runApp(MyApp());
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
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              RaisedButton(
                child: Text ('Sök efter recept'), 
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeSearch()));
               }
              ),
               RaisedButton(
                child: Text ('Mina favoriter'), 
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteView()));
                  
                }
              ),
               RaisedButton(
                child: Text ('Inköpslista'), 
                onPressed: () {
              
                Navigator.push(context, MaterialPageRoute(builder: (context) => GroceryList()));
                }
              ),
          ],
        )
      )
    );
  }
}