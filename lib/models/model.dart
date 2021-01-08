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

  int _counter = 1;
  int get counter => _counter;

  void addGrocery(Ingredient ingredient) {
    _shoppingList.add(ingredient);
    notifyListeners();
  }

  void addGroceries(List<Ingredient> ingredient) {
    _shoppingList.addAll(ingredient);
    notifyListeners();
  }

  void removeGrocery(Ingredient ingredient) {
    _shoppingList.remove(ingredient);
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

  void increment(Ingredient ingredient, int counter) {
    _counter = ingredient.counter++;
    notifyListeners();
  }

  void decrement(Ingredient ingredient, int counter) {
    _counter = ingredient.counter--;
    notifyListeners();
  }
}
