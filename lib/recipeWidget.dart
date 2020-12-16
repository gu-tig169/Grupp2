import 'package:flutter/cupertino.dart';

import 'model.dart';

class RecipeWidget extends StatelessWidget {
  final Recipe recipeCard;

  RecipeWidget(this.recipeCard);

  Widget build(BuildContext context) {
    return Container(
      height: 400, 
      child: new Stack(
        children: <Widget> [
          Image.network(recipeCard.image,
        fit: BoxFit.fill),
        Text(recipeCard.title)
        ]
    ));
  }
}