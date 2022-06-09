import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/providers/search_provider.dart';
import 'package:recipes/screens/components/search_box.dart';
import 'package:recipes/screens/search_result/components/search_list.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String query = Provider.of<SearchProvider>(context, listen: false).query;
    return Scaffold(
      appBar: AppBar(
        title: Text("Result for '$query'"),
      ),
      body: Column(
        children: const <Widget>[
          SearchBox(),
          Flexible(
            child: SearchList(),
          ),
        ],
      ),
    );
  }
}
