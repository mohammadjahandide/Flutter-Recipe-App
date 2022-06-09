import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:recipes/models/ingredient.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/utils/data/api_key.dart';

const _url = 'https://api.spoonacular.com/recipes/';

enum Error { noError, noInternet, statusCode402, nothingFound, noMore }

class RecipeData {
  static Future<dynamic> getData(String url) async {
    try {
      http.Response response =
          await http.get(Uri.parse('$_url${url}apiKey=$apiKey'));
      if (response.statusCode == 200) {
        return convert.jsonDecode(response.body);
      } else {
        throw Error.statusCode402;
      }
    } catch (e) {
      throw Error.noInternet;
    }
  }

  static Recipe _extractRecipe(dynamic data) {
    return Recipe(
      id: data['id'] as int,
      title: data['title'].toString(),
      imageUrl: data['image'].toString(),
      readyInMinutes: data['readyInMinutes'] as int,
      summary: data['summary'].toString(),
      vegetarian: data['vegetarian'] as bool,
      ingredients: getIngredient(data['extendedIngredients'] as List<dynamic>),
      instuctions: getInstuction(data['analyzedInstructions'] as List<dynamic>),
    );
  }

  static Future<List<Recipe>> getRandomData(String number, String tags) async {
    final data = await getData('random?number=$number&tags=$tags&') as Map;
    List<Recipe> recipes = [];
    for (dynamic json in data['recipes']) {
      recipes.add(
        _extractRecipe(json),
      );
    }
    return recipes;
  }

  static Future<Recipe> getRecipeInformation(int id) async {
    final data = await getData('$id/information?');
    return _extractRecipe(data);
  }

  static Future<List<Recipe>> getSimilar(int id, String number) async {
    final data = await getData('$id/similar?number=$number&');
    List<Recipe> recipes = [];
    for (dynamic json in data) {
      recipes.add(
        Recipe(
          id: json['id'] as int,
          title: json['title'].toString(),
          imageUrl:
              'https://spoonacular.com/recipeImages/${json['id']}-312x150.jpg',
        ),
      );
    }
    return recipes;
  }

  static Future<List<Recipe>> searchRecipe(String query, String number) async {
    final data =
        await getData('complexSearch?query=$query&number=$number&') as Map;
    List<Recipe> recipes = [];
    for (dynamic json in data['results']) {
      recipes.add(
        Recipe(
          id: json['id'] as int,
          title: json['title'].toString(),
          imageUrl: json['image'].toString(),
        ),
      );
    }
    return recipes;
  }

  static List<String> getInstuction(List<dynamic> instructions) {
    if (instructions.isEmpty) {
      return [];
    }
    return List<String>.from(
      (List<Map<String, dynamic>>.from(instructions)[0]['steps'])
          .map((e) => e['step']),
    );
  }

  static List<Ingredient> getIngredient(List<dynamic> ingredients) {
    return List<Ingredient>.from(
      (ingredients).map(
        (ingredient) => Ingredient(
            id: ingredient['id'] as int,
            image: '${ingredient['image']}',
            name: ingredient['name'],
            amount: ingredient['amount'].toString(),
            unit: ingredient['unit'].toString()),
      ),
    );
  }
}
