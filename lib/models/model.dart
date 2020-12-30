import 'dart:core';
import 'package:flutter/material.dart';
import 'package:recipe/models/ingredientsModel.dart';
import 'package:recipe/models/instructionsModel.dart';
import 'recipeModel.dart';

class RecipeInformation {
  Recipe recipe;
  List<Ingredient> ingredient;
  List<Instruction> instructions;
  RecipeInformation({this.ingredient, this.instructions, this.recipe});
}
class MyState extends ChangeNotifier {
  List<Ingredient> _list = [];
  List <Ingredient> get list => _list;

void removeGrocery(int index) {
  _list.removeAt(index);
  notifyListeners();
}
}