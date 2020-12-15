import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

const API_URL = 'https://api.spoonacular.com';
const API_KEY = '807f16c42d604fa1a965952a9473bccc'; //alla kommer åt denna nyckeln så den behöver inte ändras

class API {
  static Future getRecipes(String query) async {
    var response = await http.get(API_URL +
        '/recipes/complexSearch?query=$query&number=20&apiKey=$API_KEY');
    return response;
  }
 //här har vi påbörjat en get-funktion för att hämta hela receptet och visa i recipeView
 //vi tänkte att det hade varit passande att använda den här funktionen från spoonacular:
 //https://spoonacular.com/food-api/docs#Get-Recipe-Information
 //där vi kan skicka med de parametrar som vi vill visa i recipeView(titeln, ingredienser och instruktioner)
  static Future getRecipeInformation(int id) async {
    var response = await http.get(API_URL +
        '/recipes/$id/information&apiKey=$API_KEY');
    
    return response;
  }

  
  }

