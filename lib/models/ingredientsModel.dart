class Ingredient {
  String ingredient, name, aisle;
  bool done;
  int id, counter;

  Ingredient({
    this.ingredient,
    this.name,
    this.aisle,
    this.done = false,
    this.id,
    this.counter = 1,
  });

  static Ingredient fromJson(Map<String, dynamic> json) {
    return Ingredient(
      ingredient: json['original'],
      name: json['name'],
      aisle: json['aisle'],
      id: json['id'],
    );
  }
}
