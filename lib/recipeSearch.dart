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
          : _recipeCard(),
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
            hintText: 'Enter recipe or groceries to be included',
            suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                }),
          ),
        ),
      ),
    );
  }

  Widget _recipeCard() {
    return ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Container(
                      width: 100,
                      child: Card(
                          child: Stack(children: <Widget>[
                        Container(
                            width: 500,
                            height: 280,
                            decoration: new BoxDecoration(color: Colors.white),
                            child: Image.network(recipes[index].image,
                                color: Colors.grey[500].withOpacity(1.0),
                                colorBlendMode: BlendMode.modulate,
                                fit: BoxFit.cover)),
                        Positioned(
                            bottom: 40,
                            left: 140,
                            child: Container(
                                width: 200,
                                height: 80,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(15),
                                child: Row(children: [
                                  Icon(Icons.timer_sharp,
                                      size: 26, color: Colors.white),
                                  Text(
                                      (recipes[index]
                                              .readyInMinutes
                                              .toString()) +
                                          ('min'),
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                      )),
                                ]))),
                        Positioned(
                            bottom: 100,
                            child: Container(
                                height: 80,
                                width: 400,
                                alignment: Alignment.center,
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 30, right: 30),
                                    child: Text(
                                      recipes[index].title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ))))
                      ])))),
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
