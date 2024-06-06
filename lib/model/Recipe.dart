class Recipe {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumbnail;

  Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnail,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: json['strInstructions'],
      thumbnail: json['strMealThumb'],
    );
  }
}
