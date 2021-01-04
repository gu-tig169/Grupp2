class Ingredient {
  String ingredient, name, aisle;

  Ingredient({
    this.ingredient,
    this.name,
    this.aisle,
  });

  static Map<String, dynamic> toJson(Ingredient ingredient) {
    return {
      'original': ingredient.ingredient,
      'name': ingredient.name,
      'aisle': ingredient.aisle,
    };
  }

  static Ingredient fromJson(Map<String, dynamic> json) {
    return Ingredient(
        ingredient: json['original'], name: json['name'], aisle: json['aisle']);
  }
}
