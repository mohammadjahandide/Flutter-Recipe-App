import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/providers/random_recipe_provider.dart';

class RandomRecipeScreen extends StatelessWidget {
  const RandomRecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RandomRecipeProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Recipe App',
          ),
          // backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
