import 'package:flutter/material.dart';
import 'package:recipes/utils/data/recipe_data.dart';

class ErrorScreen extends StatelessWidget {
  ///show error based Error that define in RecipeData

  final Error error;
  final Function? onClick;
  const ErrorScreen({Key? key, required this.error, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (error == Error.noInternet) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Check your Internet connection'),
          Flexible(
            child: Container(
              width: size.width * 0.23,
              margin: const EdgeInsets.only(
                top: 8,
              ),
              child: ElevatedButton(
                onPressed: () {
                  onClick!();
                },
                child: const Text('Retry'),
              ),
            ),
          ),
        ],
      );
    } else if (error == Error.nothingFound) {
      return const Center(
        child: Text('Nothing Found'),
      );
    } else if (error == Error.noMore) {
      return Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: const Text('No more items found'),
      );
    }
    return const Center(
      child: Text('Your free requests for today are over'),
    );
  }
}
