import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './model.dart';

class RecipeSearch extends StatelessWidget {
  
  String title;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _textInputField(),
            _searchButton(),
            //_recipe(),
          ]
            
        )
        )
    );
}
}



 Widget _textInputField() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Sök efter recept...',

          filled: true,
          fillColor: Colors.white,
        
          ),
        ),
    );
}
 Widget _searchButton() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textColor: Colors.black,
        child: Text('SÖK'),
        onPressed: () {
        },
      ),
    );
  }


Widget _recipe(context, Recipe recipe) {
  return Card(
    child: ListTile(
      title: Text(
        recipe.title),
        trailing: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
    ),
  )
  );


}
