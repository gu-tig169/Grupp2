import 'dart:core';
import 'package:flutter/material.dart';
import 'package:recipe/models/ingredientsModel.dart';
import 'package:recipe/models/instructionsModel.dart';
import 'recipeModel.dart';

class RecipeInformation {
  Recipe recipe;
  List<Ingredient> ingredients;
  List<Instruction> instructions;
  RecipeInformation({this.ingredients, this.instructions, this.recipe});
}

class MyState extends ChangeNotifier {
  List<Ingredient> _shoppingList = [];
  List<Ingredient> get shoppingList => _shoppingList;

  String _filterBy = 'All';
  String get filterBy => _filterBy;

  void addGrocery(Ingredient ingredient) {
    _shoppingList.add(ingredient);
    notifyListeners();
  }

  void addGroceries(List<Ingredient> ingredient) {
    _shoppingList.addAll(ingredient);
    notifyListeners();
  }

  void removeGrocery(int index) {
    _shoppingList.removeAt(index);
    notifyListeners();
  }

  void checkGrocery(Ingredient ingredient, bool done) {
    ingredient.done = done;
    notifyListeners();
  }

  void setFilterList(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
