import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:recipe/models/instructionsModel.dart';
import 'models/ingredientsModel.dart';
import 'models/model.dart';

const API_URL = 'https://api.spoonacular.com';
const API_KEY = '127912785fb741e5b0671607c2660e08';

class API {
  static Future <List<Recipe>> getRecipes(String query) async {
    var response = await http.get(API_URL +
        '/recipes/complexSearch?query=$query&number=20&apiKey=$API_KEY');
        String bodyString = response.body;
        print(response.body);
        var json = jsonDecode(bodyString);
        print (json);
        return json['results'].map<Recipe>((data) => Recipe.fromJson(data))
            .toList();
  }
//Tildas nyckel: 807f16c42d604fa1a965952a9473bccc
//Vanessas nyckel:
//Ellens nyckel:127912785fb741e5b0671607c2660e08
//Lovisas nyckel: 
 
  static Future<List<Ingredients>> getIngredients(int id) async {
    var url =
        'https://api.spoonacular.com/recipes/$id/information?apiKey=$API_KEY';
    var response = await http.get(url);
    String bodyString = response.body;
    print(response.body);
    var json = jsonDecode(bodyString);
    print(json);
    return json['extendedIngredients'].map<Ingredients>((data) {
      return Ingredients.fromJson(data);
    }).toList();
  }

  static Future<List<Instructions>> getInstructions(int id) async {
    var url =
        'https://api.spoonacular.com/recipes/$id/analyzedInstructions?apiKey=$API_KEY';
    var response = await http.get(url);
    String bodyString = response.body;
    print(response.body);
    var json = jsonDecode(bodyString);
    print(json);
    return json.map<Instructions>((data) {
      return Instructions.fromJson(data);
    }).toList();
  }
   static Future<List<Ingredients>> getGrocery(String query) async {
    var url =
 'https://api.spoonacular.com/food/ingredients/search?query=$query&apiKey=$API_KEY';
    var response = await http.get(url);
    String bodyString = response.body;
    print(response.body);
    var json = jsonDecode(bodyString);
    print(json);
    return json['results'].map<Ingredients>((data) {
      return Ingredients.fromJson(data);
    }).toList();
}
}