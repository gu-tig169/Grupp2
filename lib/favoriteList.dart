import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/model.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatefulWidget {
  final List<Recipe> list;
  FavoriteList({this.list});

  @override
  _FavoriteListState createState() => _FavoriteListState();
}
class _FavoriteListState extends State<FavoriteList> {
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          _favoriteRecipe(context, widget.list[index], index),
      itemCount: widget.list.length,
    );
  }

  Widget _favoriteRecipe(context, Recipe recipe, index) {
    return ListTile(
      title: Text(recipe.title),
      leading: Icon(Icons.star),
      trailing: IconButton(
        onPressed: () {
          Provider.of<MyState>(context, listen: false).removeRecipe(index);
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}
....