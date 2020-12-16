import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/main.dart';

class RecipeView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget> [
           GestureDetector(
              onTap: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context) => MainView()));
              },
              child: Icon
              (Icons.home),
            ),
          ],
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
            //  _image(),
           //   _recipeLabel(),
             // _ingredientLabel(),
            ])));
  }

  Widget _image() {
    return Container(
      height: 200,
      decoration: BoxDecoration(color: Colors.blue),
      //Image(image: ('')),
    );
  }

  Widget _recipeLabel() {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 24),
      child: Text('Receptets titel'),
    );
  }

  Widget _ingredientLabel() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Text('Ingredienser:'),
    );
  }

}
