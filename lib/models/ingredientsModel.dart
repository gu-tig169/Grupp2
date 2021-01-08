class Ingredient {
  String ingredient, name, aisle;
  bool done;
  int id;
  int counter = 1;

  Ingredient({
    this.ingredient,
    this.name,
    this.aisle,
    this.done = false,
    this.id,
  });

  static Map<String, dynamic> toJson(Ingredient ingredients) {
    return {
      'original': ingredients.ingredient,
      'name': ingredients.name,
      'title': ingredients.name,
      'aisle': ingredients.aisle,
      'done': ingredients.done,
      'id': ingredients.id,
    };
  }

  static Ingredient fromJson(Map<String, dynamic> json) {
    return Ingredient(
      ingredient: json['original'],
      name: json['name'],
      aisle: json['aisle'],
      done: json['done'] == null ? false : json['done'],
      id: json['id'],
    );
  }
}
