class Ingredient {
  String ingredient, name, aisle;
  bool done;

  Ingredient({this.ingredient, this.name, this.aisle, this.done = false});

  static Map<String, dynamic> toJson(Ingredient ingredients) {
    return {
      'original': ingredients.ingredient,
      'name': ingredients.name,
      'aisle': ingredients.aisle,
      'done': ingredients.done,
    };
  }

  static Ingredient fromJson(Map<String, dynamic> json) {
    return Ingredient(
      ingredient: json['original'],
      name: json['name'],
      aisle: json['aisle'],
      done: json['done'] == null ? false : json ['done'],
    );
  }
  void checkGrocery() {
    this.done =! this.done;
  }
}
