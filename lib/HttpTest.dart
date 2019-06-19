import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HttpTextState();
  }
}

class HttpTextState extends State<HttpText> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Http Test"),
      ),
      body: new ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
    );
  }

  void loadData() async{
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    print(dataURL);
    http.Response response = await http.get(dataURL);
    setState(() {
      print(response.body);
      widgets = jsonDecode(response.body);
    });
  }

  Widget getRow(int position) {
    return new Padding(
      padding: new EdgeInsets.all(10.0),
      child: new Text("Row ${widgets[position]["title"]}"),
    );
  }
}
