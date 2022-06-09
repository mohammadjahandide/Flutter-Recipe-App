import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/ingredient.dart';

class IngredientList extends StatelessWidget {
  final List<Ingredient> ingredients;
  const IngredientList({Key? key, required this.ingredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: ingredients.length,
        itemBuilder: (context, index) => Card(
          child: Column(
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/Spinner-3.gif',
                image:
                    'https://spoonacular.com/cdn/ingredients_100x100/${ingredients[index].image}',
                imageErrorBuilder: (context, object, stack) {
                  return const Center(
                    child: Text('Not Image Provid'),
                  );
                },
              ),
              Text(ingredients[index].name),
              Text('${ingredients[index].amount} ${ingredients[index].unit}'),
            ],
          ),
        ),
      ),
    );
  }
}
