import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/utils/data/recipe_data.dart';

class RandomRecipeProvider extends ChangeNotifier {
  /// provide random recipe
  /// data that fetch include this information
  /// id, title, imageUrl, readyInMinute, summary, vegetarian, ingredients, instuctions

  final List<Recipe> _recipes = [];
  ScrollController scrollController = ScrollController();

  //Indicates whether an error has occurred
  Error status = Error.noError;

  RandomRecipeProvider() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        getData();
      }
    });
  }

  UnmodifiableListView<Recipe> get recipes => UnmodifiableListView(_recipes);

  Future<void> getData({
    String number = '20',
    String tags = '',
  }) async {
    try {
      int len = _recipes.length;
      _recipes.addAll(await RecipeData.getRandomData(number, tags));
      if (_recipes.isEmpty) {
        status = Error.nothingFound;
      } else if (_recipes.length == len) {
        status = Error.noMore;
      } else {
        status = Error.noError;
      }
    } on Error catch (e) {
      status = e;
    }

    notifyListeners();
  }
}
