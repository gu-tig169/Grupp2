import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/API/API.dart';
import 'package:recipe/models/model.dart';
import 'package:recipe/Views/shoppingListView.dart';
import '../circularProcessIndicator.dart';
import '../main.dart';
import '../models/recipeModel.dart';

class RecipeView extends StatefulWidget {
  final Recipe recipe;
  RecipeView({this.recipe});

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  var recipeInformation;

  void _getRecipeInformation(Recipe recipe) async {
    var result = await API.getRecipeInformation(recipe);
    setState(() {
      recipeInformation = result;
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
                  Row(children: [
                    IconButton(
                        icon: Icon(Icons.list_alt, size: 30),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShoppingListView()));
                        }),
                    IconButton(
                        icon: Icon(Icons.home, size: 30),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainView()));
                        }),
                  ])
                ],
              ),
              body: recipeInformation == null
                  ? Container(child: CircularProgressIndicatorApp())
                  : SingleChildScrollView(
                      child: Column(children: <Widget>[
                        _recipeImage(),
                        _ingredientsLabel(),
                        Container(
                          height: 10,
                        ),
                        _ingredientList(),
                        Container(
                          height: 10,
                        ),
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
        tooltip: 'Add ingredients to shopping list',
        backgroundColor: Colors.orange.withOpacity(0.5),
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.addGroceries(recipeInformation.ingredients);
          showDialog(
              context: context,
              builder: (context) {
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.of(context).pop(true);
                });
                return new AlertDialog(
                    title: const Text(
                        'The ingredients has been added to your shoppinglist',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                    backgroundColor: Colors.grey[900].withOpacity(0.7));
              });
        });
  }

  Widget _recipeImage() {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
          height: 400,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage((recipeInformation.recipe.image)),
          ))),
      Positioned(
          bottom: 0,
          child: Container(
              width: 430,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                      topLeft: Radius.circular(80))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 80, right: 80, top: 20),
                        child: Text(recipeInformation.recipe.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))),
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.restaurant,
                                  size: 18, color: Colors.black),
                              Text(
                                  (' ') +
                                      (recipeInformation.recipe.servings
                                          .toString()) +
                                      (' Servings '),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              Icon(Icons.timer_sharp,
                                  size: 22, color: Colors.black),
                              Text(
                                  (recipeInformation.recipe.readyInMinutes
                                      .toString()),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ))
                            ]))
                  ])))
    ]);
  }

  Widget _ingredientList() {
    var ingredients = recipeInformation.ingredients;
    return Padding(
        padding: EdgeInsets.only(left: 15),
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
                                style: TextStyle(fontSize: 18))),
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
                          ])));
                })));
  }
}

Widget _ingredientsLabel() {
  return Container(
      alignment: Alignment.center,
      child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20),
          child: Row(children: [
            Icon(Icons.list_alt_rounded, size: 30, color: Colors.black),
            Text(
              '  INGREDIENTS',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: (FontWeight.bold)),
            )
          ])));
}

Widget _instructionsLabel() {
  return Container(
    alignment: Alignment.center,
    child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Icon(Icons.restaurant_menu, size: 30, color: Colors.black),
            Text(
              '  INSTRUCTIONS',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: (FontWeight.bold)),
            )
          ],
        )),
  );
}
