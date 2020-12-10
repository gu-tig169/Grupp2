import 'package:flutter/cupertino.dart';

import 'API.dart';

class Recipe {
  String title;

  Recipe({
    this.title,
  });

  static Map<String, dynamic> toJson(Recipe recipe) {
    return {
      'query': recipe.title,
    };
  }

  static Recipe fromJson(Map<String, dynamic> json) {
    return Recipe(title: json['query']);
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

  Future getRecipe() async {
    List<Recipe> list = await API.getRecipe();
    _list = list;
    notifyListeners();
  }
}
