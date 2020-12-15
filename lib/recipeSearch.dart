import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';

const API_URL = 'https://api.spoonacular.com';
const API_KEY = '807f16c42d604fa1a965952a9473bccc';
TextEditingController _controller = TextEditingController();

class API {
  static Future getRecipes(String query) async {
    var response = await http.get(API_URL +
        '/recipes/complexSearch?query=$query&number=20&apiKey=$API_KEY');
    //    headers: {'X-RapidAPI-Key': API_KEY});
    return response;
  }
}

class RecipeSearch extends StatefulWidget {
  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  var recipes = new List<Recipe>();
  Color color;

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
              return Container(
                  height: 80.0,
                  child: ListTile(
                    //  decoration: InputDecoration(),
                    title: Text(recipes[index].title,
                        style: TextStyle(fontSize: 16)),
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: NetworkImage(recipes[index].image),
                              fit: BoxFit.cover)),
                    ),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {},
                  ));
            }));
  }
}
