import 'package:flutter/material.dart';
import 'models/model.dart';
import 'models/ingredientsModel.dart'; //används inte?

class RecipeWidget extends StatelessWidget {
  final RecipeInformation recipeCard;

  RecipeWidget(this.recipeCard);

  
//var recipeInformation = new List<RecipeInformation>();
  Widget build(BuildContext context) { 
    return Container(
        height: 400,
        child: new Stack(
          children: <Widget>[
          Image.network(recipeCard.recipe.image, fit: BoxFit.fill),
          Text(recipeCard.recipe.title),
         
        
          ]  
          ),
    );
        
  }
}
