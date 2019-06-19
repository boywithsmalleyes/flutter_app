import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class IsolatePage extends StatefulWidget {
  @override
  _IsolatePageState createState() => new _IsolatePageState();
}

class _IsolatePageState extends State<IsolatePage> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text ("Isolate test"),
      ),
      body: getBody(),
    );
  }

  showLoadingDialog() {
    if (widgets.length == 0) {
      return true;
    }
    return false;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  ListView getListView() {
    return new ListView.builder(
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
        itemCount: widgets.length);
  }


  Widget getRow(int position) {
    return new Padding(
      padding: new EdgeInsets.all(10.0),
      child: new Text("Row ${widgets[position]["title"]}"),
    );
  }

  void loadState() async {
    ReceivePort receiverPort = new ReceivePort();
    await Isolate.spawn(dataLoader, receiverPort.sendPort);

    SendPort sendPort = await receiverPort.first;
    List message = await sendReceive(
        sendPort, "https://jsonplaceholder.typicode.com/posts");

    setState(() {
      widgets = message;
    });
  }

  static dataLoader(SendPort sendPort) async {
    ReceivePort receivePort = new ReceivePort();

    sendPort.send(receivePort.sendPort);
    await for (var msg in receivePort) {
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataUrl = data;
      http.Response response = await http.get(dataUrl);
      replyTo.send(jsonDecode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = new ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
}
