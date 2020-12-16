import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/recipeSearch.dart';
import './groceryList.dart';
import './favoriteView.dart';

void main() {
  runApp(MyApp());
}

//test
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
          backgroundColor: (Colors.grey
          ),
        ),
        body: Container(
          //Lagt till nedan (fram till child) för att kunna använda bakgrundsbild
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration (
            image: DecorationImage(
              image: AssetImage('assets/backgroundpicture.jpg'),
              fit: BoxFit.cover, 
               )
            ),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
      
           RaisedButton(
                child: Text('Sök efter recept'),
                //hanterar knappens storlek
               padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
               elevation:10, //skugga bakom knapparna
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecipeSearch()));
                }),
                
                Container(height: 30, width: 50,),
            RaisedButton(
                child: Text('Mina favoriter'),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                elevation:10,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavoriteView()));
                }),
                Container(height: 30, width: 50,),
            RaisedButton(
                child: Text('Inköpslista'),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                elevation:10,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GroceryList()));
                }),
          ],
        )));
  }
 
}