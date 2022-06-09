import 'package:flutter/material.dart';
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Recipe App'),
        ),
      ),
    );
  }
}
