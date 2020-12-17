import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/API.dart';
import 'package:recipe/main.dart';
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

  _getRecipeInformation(int id) async {
    var instructions = await API.getInstructions(id);
    var ingredients = await API.getIngredients(id);
    setState(() {
      var steps = json.decode(instructions.body);
      var extendedIngredients = json.decode(ingredients.body);

      print(steps);
      print(extendedIngredients);
      recipeInfo = steps["steps"]
          .map<RecipeInformation>((model) => RecipeInformation.fromJson(model))
          .toList();
      extendedIngredients["extendedIngredients"]
          .map<RecipeInformation>((model) => RecipeInformation.fromJson(model))
          .toList();
    });
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
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => MainView()));
              },
              child: Icon(Icons.home),
            ),
          ],
        ),
        body: Center(
            //   child: RecipeWidget(recipeCard)),
            ));
  }
}
