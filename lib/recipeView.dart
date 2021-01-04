import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/API.dart';
import 'package:recipe/circularProcessIndicator.dart';
import 'package:recipe/main.dart';
import 'package:recipe/models/model.dart';
import 'models/recipeModel.dart';

class RecipeView extends StatefulWidget {
  final Recipe recipe;
  RecipeView({this.recipe});

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  var recipeInformation;

  void _getRecipeInformation(Recipe recipe) async {
    var information = await API.getRecipeInformation(recipe);
    setState(() {
      recipeInformation = information;
    });
  }

  initState() {
    super.initState();
    _getRecipeInformation(widget.recipe);
  }

  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, setState) => Scaffold(
              backgroundColor: const Color(0xFFFFFFFF),
              appBar: AppBar(
                backgroundColor: const Color(0xFF9AB39F),
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainView()));
                      },
                      child: Icon(Icons.home, size: 30),
                    ),
                  )
                ],
              ),
              body: recipeInformation == null
                  ? Container(child: CircularProgressIndicatorApp())
                  : SingleChildScrollView(
                      child: Column(children: <Widget>[
                        _recipeImage(),
                        // _recipeTitle(),
                        _ingredientsLabel(),
                        Container(
                          height: 10,
                        ),
                        //  _groupedList(),
                        _ingredientList(),
                        _instructionsLabel(),
                        Container(
                          height: 10,
                        ),
                        _instructionList(),
                      ]),
                    ),
              floatingActionButton: _addToList(context),
            ));
  }

  Widget _addToList(context) {
    return FloatingActionButton(
        child: Icon(Icons.add_shopping_cart, size: 30),
        backgroundColor: Colors.orange.withOpacity(0.5),
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.addGrocery(recipeInformation.ingredient.name);
          Navigator.pop(context);
          //GroceryList()));
        });
  }

  Widget _recipeImage() {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
          height: 350,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage((recipeInformation.recipe.image)),
          )),
          alignment: Alignment.bottomLeft,
          child: Container(
              height: 100,
              width: 500,
              color: const Color(0xFF9AB39F).withOpacity(0.7),
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(recipeInformation.recipe.title,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ))))))
    ]);
  }

  Widget _ingredientList() {
    var ingredients = recipeInformation.ingredient;
    return Padding(
        padding: EdgeInsets.all(15),
        child: Container(
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 10, right: 100),
                            child: Text(ingredients[index].ingredient,
                                style: TextStyle(fontSize: 18)))
                      ]);
                })));
  }

  Widget _instructionList() {
    var instructions = recipeInformation.instructions;
    return Padding(
        padding: EdgeInsets.all(15),
        child: Container(
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: instructions.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.all(15),
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: "STEP ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: instructions[index].number.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                              text: ".  ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: instructions[index].step,
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ));
                })));
  }
}

Widget _ingredientsLabel() {
  return Container(
    height: 70,
    color: const Color(0xFF9AB39F),
    alignment: Alignment.center,
    child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Icon(Icons.list_alt_rounded, size: 30, color: Colors.white),
            Text(
              '  INGREDIENTS',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: (FontWeight.bold)),
            )
          ],
        )),
  );
}

Widget _instructionsLabel() {
  return Container(
    height: 70,
    color: const Color(0xFF9AB39F),
    alignment: Alignment.center,
    child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Icon(Icons.restaurant_menu, size: 30, color: Colors.white),
            Text(
              '  INSTRUCTIONS',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: (FontWeight.bold)),
            )
          ],
        )),
  );
}
