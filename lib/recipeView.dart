import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/API.dart';
import 'package:recipe/circularProcessIndicator.dart';
import 'package:recipe/groceryListView.dart';
import 'package:recipe/main.dart';
import 'groceryList.dart';
import 'models/recipeModel.dart';

class RecipeView extends StatefulWidget {
  final Recipe recipe;
  RecipeView({this.recipe});

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  var recipeInfo;

  void _getRecipeInformation(Recipe recipe) async {
    var information = await API.getRecipeInformation(recipe);
    setState(() {
      recipeInfo = information;
    });
  }

  initState() {
    super.initState();
    _getRecipeInformation(widget.recipe);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9AB39F),
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
      body: recipeInfo == null
          ? Container(child: CircularProgressIndicatorApp())
          : SingleChildScrollView(
              child: Column(children: <Widget>[
                _recipeImage(),
                // _recipeTitle(),
                Container(
                  height: 30,
                ),
                _ingredientsLabel(),
                Container(
                  height: 10,
                ),
                _ingredientList(),
                Container(
                  height: 30,
                ),
                _instructionsLabel(),
                Container(
                  height: 10,
                ),
                _instructionList(),
              ]),
            ),
      floatingActionButton: _addToList(context),
    );
  }

  Widget _addToList(context) {
    return FloatingActionButton(
        child: Icon(Icons.add_shopping_cart, size: 30),
        backgroundColor: Colors.orange.withOpacity(0.5),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      GroceryListView(recipeInformation: recipeInfo)));
        });
  }

  Widget _recipeImage() {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
          height: 350,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage((recipeInfo.recipe.image)),
          )),
          alignment: Alignment.bottomLeft,
          child: Container(
              height: 100,
              width: 500,
              color: Colors.black.withOpacity(0.6),
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(recipeInfo.recipe.title,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ))))))
    ]);
  }

  Widget _ingredientList() {
    var ingredients = recipeInfo.ingredient;
    return Padding(
        padding: EdgeInsets.all(15),
        child: Container(
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                    ingredients[index].ingredient,
                  ));
                })));
  }

  Widget _instructionList() {
    var instructions = recipeInfo.instructions;
    return Padding(
        padding: EdgeInsets.all(15),
        child: Container(
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: instructions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                    instructions[index].step,
                    style: TextStyle(fontSize: 18),
                  ));
                })));
  }

  Widget _ingredientsLabel() {
    return Padding(
        padding: EdgeInsets.only(left: 30),
        child: Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Ingredients',
            style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: (FontWeight.bold)),
          ),
        ));
  }
}

Widget _instructionsLabel() {
  return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          'Preparation',
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: (FontWeight.bold)),
        ),
      ));
}
