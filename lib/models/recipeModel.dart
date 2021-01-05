class Recipe {
  String title;
  int id, readyInMinutes, servings;
  String image;

  Recipe({this.title, this.id, this.image, this.readyInMinutes, this.servings});

  static Map<String, dynamic> toJson(Recipe recipe) {
    return {
      'title': recipe.title,
      'id': recipe.id,
      'image': recipe.image,
      'readyInMinutes': recipe.readyInMinutes,
      'servings': recipe.servings,
    };
  }

  static Recipe fromJson(Map<String, dynamic> json) {
    return Recipe(
        title: json['title'],
        id: json['id'],
        image: json['image'],
        readyInMinutes: json['readyInMinutes'],
        servings: json['servings']);
  }
}
