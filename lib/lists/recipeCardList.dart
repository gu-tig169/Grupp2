import 'package:flutter/material.dart';
import 'package:recipe/Views/recipeView.dart';
import 'package:recipe/models/recipeModel.dart';

class RecipeCardList extends StatelessWidget {
  final List<Recipe> recipeCardList;
  RecipeCardList({this.recipeCardList});

  Widget build(BuildContext context) {
    var recipes = recipeCardList;

    return ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Container(
                      width: 100,
                      child: Card(
                          child: Stack(children: <Widget>[
                        Container(
                            width: 500,
                            height: 280,
                            decoration: new BoxDecoration(color: Colors.white),
                            child: Image.network(recipes[index].image,
                                color: Colors.grey[500].withOpacity(1.0),
                                colorBlendMode: BlendMode.modulate,
                                fit: BoxFit.cover)),
                        Positioned(
                            bottom: 40,
                            left: 140,
                            child: Container(
                                width: 200,
                                height: 80,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(15),
                                child: Row(children: [
                                  Icon(Icons.timer_sharp,
                                      size: 26, color: Colors.white),
                                  Text(
                                      (recipes[index]
                                              .readyInMinutes
                                              .toString()) +
                                          ('min'),
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                      )),
                                ]))),
                        Positioned(
                            bottom: 100,
                            child: Container(
                                height: 80,
                                width: 400,
                                alignment: Alignment.center,
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 30, right: 30),
                                    child: Text(
                                      recipes[index].title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ))))
                      ])))),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeView(recipe: recipes[index]),
                    ));
              });
        });
  }
}
