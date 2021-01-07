import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe/models/ingredientsModel.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '60693351-0325-4734-a2eb-e04fdb47e57c';

class SecondApi {
  static Future<List<Ingredient>> getShoppingList() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    String bodyString = response.body;
    print(response.body);
    var json = jsonDecode(bodyString);
    print(json);
    return json.map<Ingredient>((data) {
      return Ingredient.fromJson(data);
    }).toList();
  }

  static Future addGrocery(Ingredient ingredient) async {
    print(ingredient);
    var json = jsonEncode(Ingredient.toJson(ingredient));
    print(json);
    await http.post('$API_URL/todos?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
  }
}
