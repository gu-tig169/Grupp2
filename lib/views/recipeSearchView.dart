import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/circularProcessIndicator.dart';
import 'package:recipe/lists/recipeCardList.dart';
import '../API/API.dart';
import '../models/recipeModel.dart';

TextEditingController _controller = TextEditingController();

class RecipeSearchView extends StatefulWidget {
  final List<Recipe> list;
  RecipeSearchView({this.list});

  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearchView> {
  var recipes;

  _getRecipes(String query) async {
    var recipeResults = await API.getRecipes(query);
    setState(() {
      recipes = recipeResults;
    });
  }

  initState() {
    super.initState();
    _getRecipes(" ");
    _controller.clear();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
          backgroundColor: const Color(0xFF9AB39F),
          title: Text(
            'Search recipies',
            style: TextStyle(fontSize: 20),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Row(
                children: <Widget>[
                  _searchField(),
                ],
              ))),
      body: recipes == null
          ? Container(child: CircularProgressIndicatorApp())
          : RecipeCardList(recipeCardList: recipes),
    );
  }

  Widget _searchField() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 12.0, bottom: 8.0, right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: TextFormField(
          style: TextStyle(fontSize: 14),
          onChanged: (String text) {
            _getRecipes(_controller.text);
          },
          controller: _controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15.0),
            border: InputBorder.none,
            hintText: 'Enter recipe or ingredients to be included',
            suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  _getRecipes("");
                }),
          ),
        ),
      ),
    );
  }
}
