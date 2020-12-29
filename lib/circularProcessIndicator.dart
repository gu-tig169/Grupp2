import 'package:flutter/material.dart';

class CircularProgressIndicatorApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircularProgressIndicatorAppState();
  }
}

class CircularProgressIndicatorAppState
    extends State<CircularProgressIndicatorApp> {
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(14.0),
        child: _loading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.lightGreen,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.green,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.white))));
  }
}
