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
    await API.getInstructions(id);
    await API.getIngredients(id);
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
      body: ListView.builder(
        itemCount: recipeInfo.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              recipeInfo[index].ingredients.ingredient,
              //   child: RecipeWidget(recipeCard)),
            ),
          );
        },
      ),
    );
  }
}
