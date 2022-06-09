import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/providers/recipe_information_provider.dart';
import 'package:recipes/providers/similar_provider.dart';
import 'package:recipes/screens/components/search_box.dart';
import 'package:recipes/screens/recipe_information/components/body.dart';

class RecipeInformationScreen extends StatelessWidget {
  final int recipeId;
  final String title;
  const RecipeInformationScreen({
    Key? key,
    required this.recipeId,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => RecipeInformationProvider(id: recipeId)),
        ),
        ChangeNotifierProvider(
          create: ((context) => SimilarProvider(id: recipeId)),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.green,
          title: Text(
            title,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
        body: Column(
          children: const <Widget>[
            SearchBox(),
            Flexible(
              child: Body(),
            ),
          ],
        ),
      ),
    );
  }
}
