import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/API.dart';
import 'package:recipe/main.dart';
import 'package:recipe/model.dart';

class RecipeView extends StatefulWidget {
  RecipeView(getRecipes);

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  var recipeInfo = new List<Recipe>();

  _getRecipeInformation(int id) {
    API.getRecipeInformation(id).then((response) {
      setState(() {
        var extendedIngredients = json.decode(response.body);
        print(extendedIngredients);
        recipeInfo = extendedIngredients[""]
            .map<Recipe>((model) => Recipe.fromJson(model))
            .toList();
      });
    });
  }

  initState() {
    super.initState();
    //  _getRecipeInformation(id);
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          //  _image(),
            //_recipeLabel(),
            //_ingredientLabel(),
            ])));
  }

  Widget _image() {
    return Container(
      height: 200,
      decoration: BoxDecoration(color: Colors.blue),
      //Image(image: ('')),
    );
  }

  Widget _recipeLabel() {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 24),
      child: Text('Receptets titel'),
    );
  }

  Widget _ingredientLabel() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Text('Ingredienser:'),
    );
  }
}