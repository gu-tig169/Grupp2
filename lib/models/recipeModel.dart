class Recipe {
  String title, image;
  int id, readyInMinutes, servings;

  Recipe({this.title, this.id, this.image, this.readyInMinutes, this.servings});

  static Recipe fromJson(Map<String, dynamic> json) {
    return Recipe(
        title: json['title'],
        id: json['id'],
        image: json['image'],
        readyInMinutes: json['readyInMinutes'],
        servings: json['servings']);
  }
}
