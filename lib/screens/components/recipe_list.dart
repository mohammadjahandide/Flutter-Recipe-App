import 'dart:collection';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipes/models/recipe.dart';
import 'package:recipes/screens/recipe_information/recipe_information_screen.dart';

class RecipeList extends StatelessWidget {
  final UnmodifiableListView<Recipe> recipes;
  final ScrollController? scrollController;
  const RecipeList({Key? key, required this.recipes, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (size.width / 200).floor(),
        ),
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => RecipeInformationScreen(
                        recipeId: recipes[index].id,
                        title: recipes[index].title,
                      )),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    Hero(
                      tag: recipes[index].id,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/Spinner-3.gif',
                        image: recipes[index].imageUrl!,
                        imageErrorBuilder: (context, object, stack) {
                          return Center(
                            child: Image.asset(
                              'assets/noImage.png',
                              width: size.width * 0.2,
                              height: size.height * 0.2,
                            ),
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          recipes[index].title,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
