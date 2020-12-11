import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './model.dart';

class RecipeSearch extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => '');

  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  String selectedResults;

  @override
  Widget buildResults(BuildContext context) {
    return Container(
        child: Center(
      child: Text(selectedResults),
    ));
  }

  final List<String> listExample;
  Search(this.listExample);
  final List<String> recentList = [];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(listExample.where(
            (element) => element.contains(query),
          ));

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
                suggestionList[index],
              ),
              onTap: () {
                selectedResults = suggestionList[index];
                showResults(context);
              });
        });
  }
}

class _RecipeSearchState extends State<RecipeSearch> {
  String title;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: Search(widget.list));
          },
          icon: Icon(Icons.search),
        )
      ]),
      body: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) => ListTile(
                  title: Text(
                widget.list[index],
              ))),
    );
  }
}
