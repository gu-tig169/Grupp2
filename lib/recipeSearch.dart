import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'API.dart';
import 'model.dart';
import 'recipeView.dart';

TextEditingController _controller = TextEditingController();

class RecipeSearch extends StatefulWidget {
  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  var recipes = new List<Recipe>(); //listan med recept
  
//funktion som används för att skicka queryn och ändrar state och lägger in resultatet i en lista
  _getRecipes(String query) {
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
 
  _getRecipeInformation(int id) {
    API.getRecipeInformation(id).then((response) {
      setState(() {
        var extendedIngridients = json.decode(response.body);
        print(extendedIngridients);
        //information = extendedIngridients[""]
           // .map<Recipe>((model) => Recipe.fromJson(model))
             //   .toList();
      });
    }); 
  }

  initState() {
    super.initState();
    _getRecipes(""); 
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                        onChanged: (String text) {},
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Sök efter recept',
                          contentPadding: const EdgeInsets.only(left: 24.0),
                          border: InputBorder.none,
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
              return Card(                         
                  child: ListTile(                   
                    leading: Image.network((recipes[index].image), height: 500, fit: BoxFit.fill), 
                    title: Text(recipes[index].title, 
                        style: TextStyle(fontSize: 16)
                        ),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () async {
                    //hämtar receptet på dess id genom att använda getRecipeInformation.
                  // Recipe recipe =
                    //await API.getRecipeInformation(recipe.id);
                     Navigator.push(
                    context, 
              MaterialPageRoute(builder: (context) => RecipeView(/*_getRecipes(recipes[index].title*/)),
                      //)
                      );
                    },
                  ));
            }
            )
            );
  }
}
