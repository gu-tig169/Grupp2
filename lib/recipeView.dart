import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/API.dart';
import 'package:recipe/main.dart';
import 'package:recipe/models/model.dart';
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
  //var recipeIngredients = new List<Ingredient>();
  //var recipeInstructions = new List<Instruction>();

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
      backgroundColor: const Color(0xFFFFE4E1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE4E1),
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
          ? Container()
          : SingleChildScrollView(
              child: Column(
              children: <Widget>[
                Container(
                    child: SizedBox(
                  width: MediaQuery.of(context).size.width * 85,
                  child: Image.network((recipeInfo.recipe.image),
                      fit: BoxFit.fill),
                )),
                Container(
                  height: 70,
                  width: 500,
                  color: const Color(0xFFFFE4E1),
                  child: Text(
                    recipeInfo.recipe.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'INGREDIENTS',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                    child: Text(
                  'INSTRUCTIONS',
                  style: TextStyle(fontSize: 20),
                )),
                Container(
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: recipeInfo.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text(
                            recipeInfo.instructions[index].step,
                          ));
                        }))
              ],
            )),
      floatingActionButton: _addToList(context),
    );
  }

  Widget _addToList(context) {
    return FloatingActionButton(
        child: Icon(Icons.add_shopping_cart, size: 30),
        backgroundColor: Colors.grey,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GroceryList(recipeInfo.ingredients)));
        });
  }

  Widget _ingredientList() {
    var ingredients = recipeInfo.ingredients;
    return Container(
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
            }));
  }
}
