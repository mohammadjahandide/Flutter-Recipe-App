import 'package:flutter/foundation.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/utils/data/recipe_data.dart';

class RecipeInformationProvider extends ChangeNotifier {
  /// provider information for specific recipe
  /// id, title, imageUrl, readyInMinute, summary, vegetarian, ingredients, instuctions

  //id of recipe that want to fetch information
  final int id;

  //Indicates whether an error has occurred
  Error status = Error.noError;
  late Recipe recipe;
  bool getInformationCalled = false;

  RecipeInformationProvider({required this.id});

  Future<void> getInformation() async {
    getInformationCalled = true;
    try {
      recipe = await RecipeData.getRecipeInformation(id);
      status = Error.noError;
    } on Error catch (e) {
      status = e;
    }
    notifyListeners();
  }
}
