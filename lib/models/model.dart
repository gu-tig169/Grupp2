import 'dart:core';
import 'package:recipe/models/ingredientsModel.dart';
import 'package:recipe/models/instructionsModel.dart';
import 'recipeModel.dart';

class RecipeInformation {
  Recipe recipe;
  List<Ingredient> ingredient;
  List<Instruction> instructions;
  RecipeInformation({this.ingredient, this.instructions, this.recipe});

}