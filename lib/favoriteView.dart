import 'package:flutter/cupertino.dart';
//import 'package:provider/provider.dart';
//import 'package:recipe/favoriteList.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),

      appBar: AppBar(
       backgroundColor: const Color(0XFFD6D6D6),
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