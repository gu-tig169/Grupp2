import 'package:flutter/cupertino.dart';
//import 'package:provider/provider.dart';
//import 'package:recipe/favoriteList.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
            child:Text('här ska vi visa favoriter'),
        )
          ]
      )
      )
    );
}
}