import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe/models/instructionsModel.dart';
import '../models/ingredientsModel.dart';
import '../models/model.dart';
import '../models/recipeModel.dart';

const API_URL = 'https://api.spoonacular.com';
const API_KEY = '9f389d1d53224f68967710a82f76f600';

class API {
  static Future<List<Recipe>> getRecipes(String query) async {
    var response = await http.get(API_URL +
        '/recipes/complexSearch?query=$query&number=20&instructionsRequired=true&addRecipeInformation=true&apiKey=$API_KEY');
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    return json['results']
        .map<Recipe>((data) => Recipe.fromJson(data))
        .toList();
  }
//Tildas nyckel: cc4af75efb474606b40290cd87c0048f
//Vanessas nyckel:
//Ellens nyckel:127912785fb741e5b0671607c2660e08
//Lovisas nyckel: 2bd86bdb69614180b32ff3c1ad21c138
//498df339ae85443d9cef018fa131d06f

  static Future<List<Ingredient>> getIngredients(int id) async {
    var response = await http.get(API_URL +
        '/recipes/$id/information?includeNutrition=true&apiKey=$API_KEY');
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    return json['extendedIngredients'].map<Ingredient>((data) {
      return Ingredient.fromJson(data);
    }).toList();
  }

  static Future<List<Instruction>> getInstructions(int id) async {
    var response = await http.get(API_URL +
        '/recipes/$id/analyzedInstructions?stepBreakdown=true&apiKey=$API_KEY');
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    return json[0]['steps'].map<Instruction>((data) {
      return Instruction.fromJson(data);
    }).toList();
  }

  static Future getRecipeInformation(Recipe recipe) async {
    var ingredients = await getIngredients(recipe.id);
    var instructions = await getInstructions(recipe.id);
    return RecipeInformation(
        ingredients: ingredients, instructions: instructions, recipe: recipe);
  }

  static Future<List<Ingredient>> getGrocery(String query) async {
    var response = await http.get(API_URL +
        '/food/ingredients/search?query=$query&metaInformation=true&apiKey=$API_KEY');
    String bodyString = response.body;
    var json = jsonDecode(bodyString);
    return json['results'].map<Ingredient>((data) {
      return Ingredient.fromJson(data);
    }).toList();
  }

  static Future getGroceries(String query) async {
    var groceries = await getGrocery(query);
    return RecipeInformation(ingredients: groceries);
  }
}
