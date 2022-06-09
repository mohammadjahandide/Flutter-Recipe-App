import 'package:flutter/material.dart';
import 'package:recipes/screens/random_recipe.dart/ranodm_recipe_screen.dart';
import 'package:recipes/utils/constants/theme.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(context),
      home: const RandomRecipeScreen(),
    );
  }
}
