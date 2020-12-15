import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

const API_URL = 'https://api.spoonacular.com';
const API_KEY = '807f16c42d604fa1a965952a9473bccc';

class API {
  static Future getRecipes(String query) async {
    var response = await http.get(API_URL +
        '/recipes/complexSearch?query=$query&number=20&apiKey=$API_KEY');
    return response;
  }

 //där vi kan skicka med de parametrar som vi vill visa i recipeView(titeln, ingredienser och instruktioner)
  static Future getRecipeInformation(int id) async {
    var response = await http.get(API_URL +
        '/recipes/$id/information&apiKey=$API_KEY');
    
    return response;
  }

  
  }

