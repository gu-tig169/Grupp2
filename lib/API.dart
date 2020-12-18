import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:recipe/models/instructionsModel.dart';
import 'models/ingredientsModel.dart';
import 'models/model.dart';

const API_URL = 'https://api.spoonacular.com';
const API_KEY = '2bd86bdb69614180b32ff3c1ad21c138';

class API {
  static Future getRecipes(String query) async {
    var response = await http.get(API_URL +
        '/recipes/complexSearch?query=$query&number=20&apiKey=$API_KEY');
    return response;
  }

  //här vill vi skicka med de parametrar som vi vill visa i recipeView(titeln, ingredienser och instruktioner)
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
}
