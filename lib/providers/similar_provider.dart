import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/utils/data/recipe_data.dart';

class SimilarProvider extends ChangeNotifier {
  /// provider similar recipe for specific recipe
  /// information include
  /// id, title, imageUrl
  /// of recipe

  final int id;
  final List<Recipe> _recipes = [];
  ScrollController scrollController = ScrollController();
  Error status = Error.noError;

  SimilarProvider({required this.id}) {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        getData();
      }
    });
  }

  UnmodifiableListView<Recipe> get recipes => UnmodifiableListView(_recipes);

  Future<void> getData({
    String number = '5',
  }) async {
    try {
      int len = _recipes.length;
      _recipes.addAll(await RecipeData.getSimilar(id, number));
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
