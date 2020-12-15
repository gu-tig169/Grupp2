import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

const API_URL = 'https://api.spoonacular.com/';
const API_KEY = '65280183935d450689c08febc1911c10';

class API {
  static Future<List<Recipe>> getRecipe() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    print(response.body);
    var json = jsonDecode(response.body);
    print(json);

    return json.map<Recipe>((data) {
      return Recipe.fromJson(data);
    }).toList();
  }
}
