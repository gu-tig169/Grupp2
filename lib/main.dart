import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/recipeSearch.dart';
import 'groceryList.dart';
import 'grocerySearch.dart';
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
       // appBar: AppBar(
        //  backgroundColor: (Colors.grey
        //  ),
        
        body: Container(
          //Lagt till nedan (fram till child) för att kunna använda bakgrundsbild
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration (
            image: DecorationImage(
              image: AssetImage('assets/testbild.jpg'),
              fit: BoxFit.cover, 
               )
            ),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
      

             OutlineButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>RecipeSearch()));
                  print("OutlineButton");
                },
                child: Text('Recipe Search'),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                 ),
                
                Container(height: 30, width: 50,),
                OutlineButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavoriteView()));
                  print("OutlineButton");
                },
                child: Text('Favorite view'),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                 ),

        
              Container(height: 30, width: 50,),
              OutlineButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GroceryList()));
                
                  print("OutlineButton");
                },
                child: Text('Grocerylist'),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                 ),
                
          ],
        )));
  }
 
}