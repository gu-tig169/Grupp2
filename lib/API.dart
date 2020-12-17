import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'models/model.dart';

const API_URL = 'https://api.spoonacular.com';
const API_KEY = 'f4fc5441f361400da4881f4fcf3bfc7a';

class API {
  static Future getRecipes(String query) async {
    var response = await http.get(API_URL +
        '/recipes/complexSearch?query=$query&number=20&apiKey=$API_KEY');
    return response;
  }

  //här vill vi skicka med de parametrar som vi vill visa i recipeView(titeln, ingredienser och instruktioner)
  static Future getIngredients(int id) async {
    var ingredients =
        await http.get(API_URL + '/recipes/{$id}/information&apiKey=$API_KEY');
    return ingredients;
  }

  static Future getInstructions(int id) async {
    var instructions = await http
        .get(API_URL + '/recipes/{$id}/analyzedInstructions&apiKey=$API_KEY');
    return instructions;
  }
}
