import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'API.dart';
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
  var recipes = new List<Recipe>();

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
        backgroundColor: const Color(0xFFFFE4E1),
        appBar: AppBar(
            backgroundColor: const Color(0xFFFFE4E1),
            title: Text('Sök recept'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Row(
                children: <Widget>[
                  Expanded(
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
                          hintText: 'Sök efter recept',
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
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: () {
                      _getRecipes(_controller.text);
                    },
                  ),
                ],
              ),
            )),
        body: ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Card(
                      elevation: 2,
                      color: const Color(0xFFFFE4E1),
                      child: Row(children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: Image.network((recipes[index].image),
                              fit: BoxFit.fill),
                          //Image.network(widget.recipe.image, fit: BoxFit.fill),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                    recipes[index]
                                        .title, //här hämtas titeln från APIet
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ]),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeView(recipe: recipes[index]),
                        ));
                  });
            }));
  }
}
