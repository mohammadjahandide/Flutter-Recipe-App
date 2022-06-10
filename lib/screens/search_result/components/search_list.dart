import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/providers/search_provider.dart';
import 'package:recipes/screens/components/error_screen.dart';
import 'package:recipes/screens/components/list_and_error.dart';
import 'package:recipes/screens/components/recipe_list.dart';
import 'package:recipes/utils/data/recipe_data.dart';

class SearchList extends StatelessWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: ((BuildContext context, SearchProvider provider, child) {
        if (provider.status != Error.noError) {
          if (provider.recipes.isEmpty) {
            return ErrorScreen(
              error: provider.status,
              onClick: provider.getData,
            );
          }
          return ListAndError(
            error: provider.status,
            onClick: provider.getData,
            list: RecipeList(
              recipes: provider.recipes,
              scrollController: provider.scrollController,
            ),
          );
        } else if (provider.recipes.isEmpty) {
          provider.getData();
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
        }
        return RecipeList(
          recipes: provider.recipes,
          scrollController: provider.scrollController,
        );
      }),
    );
  }
}
