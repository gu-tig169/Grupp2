class Ingredient {
  String ingredient, name;

  Ingredient({this.ingredient, this.name});

  static Map<String, dynamic> toJson(Ingredient ingredient) {
    return {
      'original': ingredient.ingredient,
      'name': ingredient.name,
    };
  }

  static Ingredient fromJson(Map<String, dynamic> json) {
    return Ingredient(ingredient: json['original'], name: json['name']);
  }
}
