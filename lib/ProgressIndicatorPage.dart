import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProgressIndicatorPage extends StatefulWidget {
  @override
  _ProgressIndicatorPageState createState() =>
      new _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends State<ProgressIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Progess Dialog"),
      ),
      body: getBody(),
    );
  }

  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }
    return false;
  }

  getProgressDialog() {
    return new Center(
      child: new Image.asset('images/android.png'),
    );
  }

  ListView getListView() {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      },
      itemCount: widgets.length,
    );
  }

  getRow(int position) {
    return new Padding(
      padding: new EdgeInsets.all(10.0),
      child: new Text("Row ${widgets[position]["title"]}"),
    );
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    }
    return getListView();
  }

  void loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}
