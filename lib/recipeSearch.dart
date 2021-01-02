import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'API.dart';
import 'circularProcessIndicator.dart';
import 'recipeView.dart';
import 'models/recipeModel.dart';

TextEditingController _controller = TextEditingController();

class RecipeSearch extends StatefulWidget {
  final List<Recipe> list;
  RecipeSearch({this.list});

  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  var recipes;

  _getRecipes(String query) async {
    var recipe = await API.getRecipes(query);
    setState(() {
      recipes = recipe;
    });
  }

  initState() {
    super.initState();
    _getRecipes("");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
          backgroundColor: const Color(0xFF9AB39F),
          title: Text('Search recipies'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Row(
              children: <Widget>[
                _searchField(),
                _searchButton(),
              ],
            ),
          )),
      body: recipes == null
          ? Container(child: CircularProgressIndicatorApp())
          : _recipeCard(),
    );
  }

  Widget _searchField() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: TextFormField(
          onChanged: (String text) {
            _getRecipes(_controller.text);
          },
          controller: _controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15.0),
            border: InputBorder.none,
            hintText: 'Search recipies',
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _getRecipes("");
              },

              /*=> _controller.clear,
                            icon: Icon(Icons.clear),*/
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchButton() {
    return IconButton(
      icon: Icon(Icons.search, color: Colors.black),
      onPressed: () {
        _getRecipes(_controller.text);
      },
    );
  }

  Widget _recipeCard() {
    return ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Card(
                      child:
                          Stack(alignment: Alignment.center, children: <Widget>[
                    Container(
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage((recipes[index].image)),
                        )),
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            height: 80,
                            width: 500,
                            color: Colors.white.withOpacity(0.8),
                            child: Center(
                                child: Text(recipes[index].title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    )))))
                  ]))),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeView(recipe: recipes[index]),
                    ));
              });
        });
  }
}
