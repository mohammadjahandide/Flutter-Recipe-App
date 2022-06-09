import 'package:recipes/models/ingredient.dart';

class Recipe {
  final int id;
  final String title;
  final String? imageUrl;
  final int? readyInMinutes;
  final String? summary;
  final bool? vegetarian;
  final List<Ingredient>? ingredients;
  final List<String>? instuctions;

  const Recipe({
    required this.id,
    required this.title,
    this.imageUrl,
    this.readyInMinutes,
    this.summary,
    this.vegetarian,
    this.ingredients,
    this.instuctions,
  });

  @override
  String toString() {
    return '''Recipe{id:$id, title:$title, imageUrl:$imageUrl, 
    readyInMinute:$readyInMinutes, summary:$summary, vegetarian:$vegetarian
    }''';
  }
}
