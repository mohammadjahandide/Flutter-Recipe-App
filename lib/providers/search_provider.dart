import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/utils/data/recipe_data.dart';

class SearchProvider extends ChangeNotifier {
  /// search for Search based on what the user has entered
  /// information include
  /// id, title, imageUrl
  /// of recipe

  String query = '';
  final List<Recipe> _recipes = [];
  Error status = Error.noError;
  ScrollController scrollController = ScrollController();

  SearchProvider() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        getData();
      }
    });
  }

  UnmodifiableListView<Recipe> get recipes => UnmodifiableListView(_recipes);

  void clearRecipes() {
    _recipes.clear();
    status = Error.noError;
  }

  Future<void> getData({
    String number = '30',
  }) async {
    try {
      int len = _recipes.length;
      _recipes.addAll(await RecipeData.searchRecipe(query, number));
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
