import 'package:flutter/cupertino.dart';

import 'API.dart';

class Recipe {
  String title;
  int id;
  String image;

  Recipe({
    this.title,
    this.id,
    this.image,
  });


  static Map<String, dynamic> toJson(Recipe recipe) {
    return {
      'title': recipe.title,
      'id': recipe.id,
      'image': recipe.image,
    };
  }

  static Recipe fromJson(Map<String, dynamic> json) {
    return Recipe(title: json['title'], id: json['id'], image: json['image']);
  }
}

class MyState extends ChangeNotifier {
  List<Recipe> _list = [];
  List<Recipe> get list => _list;

  void removeRecipe(int index) {
    _list.remove(index);
    notifyListeners();
  }

  String _filterList = 'Visa alla';
  String get filterList => _filterList;

  void setFilter(String filterList) {
    this._filterList = filterList;
    notifyListeners();
  }

  /*Future _search() async {
    List<Recipe> list = await API.getRecipe();
    _list = list;
    notifyListeners();*/
}

/*void addItem(Recipe recipe) async {
    await _search();
    notifyListeners(); */

    //känns mest rimligt att deklarera det receptet som skall hämtas med ny data då det är ytterligare saker som skall hämtas
    //Att utläsa av andra liknande klasser verkar detta vara det vanligaste sättet
    //Behöver endast sätta id för att få ut all information om receptet, och för att exkludera information får vi sätta 
    //"includeNutrition" till false.
    //Börjar med att lägga in det såhär tills emulatorn samt koden fungerar och vi kan se hur det blir. 

class ShowRecipe {
    int id;
   // bool includeNutrition = false; 
    ShowRecipe ({this.id,});

    static Map<String, dynamic> toJson(ShowRecipe showrecipe) {
      return {
        'id': showrecipe.id,
        
      };
    }
    static ShowRecipe fromJson(Map<String, dynamic> json) {
      return ShowRecipe (id: json['id']);
    }

  }