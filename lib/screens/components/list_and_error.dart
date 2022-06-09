import 'package:flutter/material.dart';
import 'package:recipes/screens/components/error_screen.dart';
import 'package:recipes/utils/data/recipe_data.dart';

class ListAndError extends StatelessWidget {
  /// Show error at the bottom of the recipe list

  final Error error;
  final Function? onClick;
  final Widget? list;
  const ListAndError({
    Key? key,
    required this.error,
    this.onClick,
    this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: list ?? Container(),
        ),
        Flexible(
          child: ErrorScreen(
            error: error,
            onClick: onClick,
          ),
        ),
      ],
    );
  }
}
