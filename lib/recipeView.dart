import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/API.dart';
import 'package:recipe/main.dart';
import 'package:recipe/models/ingredientsModel.dart';
import 'package:recipe/models/instructionsModel.dart';
import 'package:recipe/models/model.dart';
import 'package:recipe/recipeWidget.dart';

class RecipeView extends StatefulWidget {
  final Recipe recipeCard;
  RecipeView(this.recipeCard);

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  var recipeInfo = new List<RecipeInformation>();
  var recipeIngredients = new List<Ingredients>();
  var recipeInstructions = new List<Instructions>();
  

  _getRecipeInformation(int id) async {
  var instructions = await API.getInstructions(id);
  setState(() {recipeInstructions = instructions;});
  
  var ingredients =  await API.getIngredients(id);
  setState(() {recipeIngredients = ingredients;});
  }

  initState() {
    super.initState();
    _getRecipeInformation(widget.recipeCard.id);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: const Color(0XFFD6D6D6),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => MainView()));
            },
            child: Icon(Icons.home),
          ),
        ],
      ),
      body: 
       SingleChildScrollView (
        child: Column(
          children: <Widget>[
            Container(
              child: SizedBox(
              width: MediaQuery.of(context).size.width * 100,
              child: Image.network((widget.recipeCard.image),
              fit: BoxFit.fill),  
            )),
            Container(
              height: 100,
              width: 500,
              color: Colors.red,
            child: Text(widget.recipeCard.title)
            ),
           Container (
             child: ListView.builder( 
              primary: false,
              shrinkWrap: true,  
              physics: NeverScrollableScrollPhysics(),  
            itemCount: recipeIngredients.length,
            itemBuilder: (context, index) {
            return ListTile(
              title: Text(
            recipeIngredients[index].ingredient,
            )
            );
          }
              )
           ),
           Container (
             child: ListView.builder( 
              primary: false,
              shrinkWrap: true,  
              physics: NeverScrollableScrollPhysics(),  
            itemCount: recipeInstructions.length,
            itemBuilder: (context, index) {
            return ListTile(
              title: Text(
            recipeInstructions[index].step,
            )
            );
          }
              )
           )
            ],
              )
              )
    );    
      
    
  }

}