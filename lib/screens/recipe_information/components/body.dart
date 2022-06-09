import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/providers/recipe_information_provider.dart';
import 'package:recipes/screens/components/error_screen.dart';
import 'package:recipes/screens/recipe_information/components/ingredient_list.dart';
import 'package:recipes/screens/recipe_information/components/instruction_list.dart';
import 'package:recipes/screens/recipe_information/components/similar.dart';
import 'package:recipes/utils/data/recipe_data.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<RecipeInformationProvider>(
      builder:
          ((BuildContext context, RecipeInformationProvider provider, child) {
        if (!provider.getInformationCalled) {
          provider.getInformation();
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (provider.status != Error.noError) {
          // provider.getInformation();
          return ErrorScreen(
            error: provider.status,
            onClick: provider.getInformation,
          );
        }
        Recipe recipe = provider.recipe;
        return ListView(
          shrinkWrap: true,
          children: <Widget>[
            Hero(
              tag: recipe.id,
              child: SizedBox(
                width: size.width,
                height: size.height * 0.4,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/Spinner-3.gif',
                    image: recipe.imageUrl!,
                    imageErrorBuilder: (context, object, stack) {
                      return Center(
                        child: Image.asset(
                          'assets/images/noImage.png',
                          width: size.width,
                          height: size.height * 0.4,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/images/done.png',
                          height: size.height * 0.1,
                          width: size.width * 0.1,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Text('  ${recipe.readyInMinutes}M'),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/vegetarian-food.png',
                            height: size.height * 0.1,
                            width: size.width * 0.1,
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: recipe.vegetarian!
                              ? Image.asset(
                                  'assets/images/vegetarian.png',
                                  height: size.height * 0.1,
                                  width: size.width * 0.1,
                                )
                              : Image.asset(
                                  'assets/images/noVegetarian.png',
                                  height: size.height * 0.1,
                                  width: size.width * 0.1,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: size.height * 0.3,
              ),
              child: IngredientList(ingredients: recipe.ingredients!),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text('How to cook this food :'),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: size.height * 0.4,
              ),
              child: InstructionList(instructions: recipe.instuctions!),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Similar Recipes'),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: size.height * 0.5,
              ),
              child: Similar(
                id: recipe.id,
              ),
            ),
          ],
        );
      }),
    );
  }
}
