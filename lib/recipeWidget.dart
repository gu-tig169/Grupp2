import 'package:flutter/material.dart';
import 'package:recipe/models/ingredientsModel.dart';
import 'models/model.dart';

class RecipeWidget extends StatelessWidget {
  final RecipeInformation recipeCard;

  RecipeWidget(this.recipeCard);

  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: new Stack(children: <Widget>[
          Image.network(recipeCard.recipe.image, fit: BoxFit.fill),
          Text(recipeCard.recipe.title),
          
        ]   
          ),
          );
        
  }
}
