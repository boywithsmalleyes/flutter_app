import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//void main() => runApp(MyApp());

class SampleAppPage extends StatefulWidget {
  @override
  createState() => new SampleState();
}

class SampleState extends State<SampleAppPage> {
  static const platform = const MethodChannel('app.channel.shared.data');
  String dataShared = 'No data';

  String textToShow = "I like Flutter";
  int count = 0;

  bool toggle = true;

  @override
  void initState() {
    super.initState();
    getSharedText();
  }

  void getSharedText() async {
    var sharedData = await platform.invokeMethod("getSharedText");
    if (sharedData != null) {
      setState(() {
        dataShared = sharedData;
      });
    }
  }

  void _toggle() async {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return new Text(dataShared);
    } else {
      return new MaterialButton(onPressed: null, child: new Text("Toggle Two"));
    }
  }

  _updateText() async {
    dataShared = await Navigator.of(context).pushNamed('/c');
    print("进入到 C 了");
    setState(() {
      dataShared = "Flutter is Awesome ${count}";
//      Navigator.of(context).pushNamed("/c");
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            _getToggleChild(),
            new IconButton(icon: new Icon(Icons.label), onPressed: _updateText)
          ],
        ),
//        child: new MaterialButton(
//          onPressed: _toggle,
//          child: new Text(textToShow),
//          padding: new EdgeInsets.only(left: 10.0, right: 10.0),
//        )
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}
