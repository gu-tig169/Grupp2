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