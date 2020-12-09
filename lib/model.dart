import 'package:flutter/cupertino.dart';

class Recipe{
  String title;


Recipe({
this.title,
});
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
}