class Ingredients {
  String ingredient;
  int id;

  Ingredients({this.ingredient, this.id});

  static Map<String, dynamic> toJson(Ingredients ingredients) {
    return {
      'original': ingredients.ingredient,
      'id': ingredients.id,
    };
  }

  static Ingredients fromJson(Map<String, dynamic> json) {
    return Ingredients(ingredient: json['original'], id: json['id']);
  }
}
