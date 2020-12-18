import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'API.dart';
import 'models/model.dart';
import 'recipeView.dart';
import 'recipeWidget.dart';

TextEditingController _controller = TextEditingController();

class RecipeSearch extends StatefulWidget {
  final List<Recipe> list;
  RecipeSearch({this.list});

  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  var recipes = new List<Recipe>(); //listan med recept

//funktion som används för att skicka queryn och ändrar state och lägger in resultatet i en lista
  _getRecipes(String query) async {
    API.getRecipes(query).then((response) {
      setState(() {
        var result = json.decode(response.body);
        print(result);
        recipes = result["results"]
            .map<Recipe>((model) => Recipe.fromJson(model))
            .toList();
      });
    });
  }

//påbörjat en funktion för getRecipeInformation som ska använda id för att skicka data till RecipeView
//ska sedan skickas med i onTap funktionen där vi går till RecipeView

  initState() {
    super.initState();
    _getRecipes(
        ""); //visar alltid recept från start utan query(om queryn är ingenting så kommer den retunera alla recept)
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        appBar: AppBar(
            backgroundColor: const Color(0XFFD6D6D6),
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
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      _getRecipes(_controller
                          .text); //tar text från TextFormField och skickar som query med _controller
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
                      color: const Color(0xffe6e3df),
                      child: Row(children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child:  
                            Image.network((recipes[index].image),
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
                          builder: (context) => RecipeView(recipes[index]),
                        ));
                  });
            }));
  }
}
