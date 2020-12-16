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

