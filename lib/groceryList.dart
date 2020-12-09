import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroceryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            onSelected: (value) {
            //  Provider.of<MyState>(context, listen: false).setFilter(value);
            },
            itemBuilder: (context) => [
                    PopupMenuItem(child: Text('Visa alla'), value: 'Visa alla'),
                    PopupMenuItem(child: Text('Klar'), value: 'Klar'),
                    PopupMenuItem(child: Text('Inte klar'), value: 'Inte klar'),
                    ]),
            ]
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

List<GroceryList> setFilter(list, filterList) {
  if (filterList == 'Klar') {
    return list.where((item) => item.done == true).toList();
  } else if (filterList == 'Inte klar') {
    return list.where((item) => item.done == false).toList();
  }
  return list;

}
}