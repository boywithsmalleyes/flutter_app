import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabasePage extends StatefulWidget {
  @override
  _DatabasePageState createState() => new _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Database Page"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: _incrementCounter,
          child: new Text("Increment Counter"),
        ),
      ),
    );
  }

  void _incrementCounter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int counter = (preferences.getInt("counter") ?? 0) + 1;
    print('Pressed $counter times.');
    preferences.setInt("counter", counter);
  }
}
