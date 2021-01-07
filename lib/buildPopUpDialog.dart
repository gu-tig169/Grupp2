
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BuildPopupDialog extends StatelessWidget{
   
   Widget build(BuildContext context) {
          return new AlertDialog(
            title: const Text ('Your groceries are added to your shoppinglist'),
            content: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            actions: [
              SizedBox(
              width: 200.0,
              height: 100.0,
              child:
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                textColor: Theme.of(context).primaryColor,
                child: const Text ('ok'),
                
              )
              )],
          );

    } }