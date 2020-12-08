import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroceryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            _addGroceryInputField(),
            _addButton(),
          ],
        )
      )
      );
  }
  Widget _addGroceryInputField() {
      return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Lägg till vara',

          filled: true,
          fillColor: Colors.white,
        
          ),
        ),
    );
}
 Widget _addButton() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: RaisedButton.icon(
        icon: Icon(Icons.add),
        textColor: Colors.black,
        label: Text('Lägg till i listan'),
        onPressed: () {
        },
      ),
    );
  }
}