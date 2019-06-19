import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => new _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; ++i) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Layout Page"),
      ),
      body: buildListViewBuilder(),
    );
  }

  buildRow() {
    return new Row(
//      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text("Row One"),
        new Text("Row Two"),
        new Text("Row Three"),
        new Text("Row Four"),
        new Text("Row Five"),
      ],
    );
  }

  buildColumn() {
    return new Column(
      children: <Widget>[
        new Text("Column One"),
        new Text("Column Two"),
        new Text("Column Three"),
        new Text("Column Four"),
        new Text("Column Five"),
      ],
    );
  }

  buildListViewBuilder() {
    return new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      },
    );
  }

  buildListView() {
    return new ListView(
      children: <Widget>[
        new GestureDetector(
          child: new Text(
            "点我",
            textScaleFactor: 5,
          ),
          onTap: () {
            print("Tap 事件");
          },
          onDoubleTap: () {
            print("doule 事件");
          },
          onLongPress: () {
            print("长按事件");
          },
        ),
        new Text("Row One",
            textDirection: TextDirection.rtl, textScaleFactor: 5.0),
        new Text("Row Two"),
        new Text("Row Three"),
        new Text("Row Four"),
        new Text("Row Five"),
        new Text("Row Five"),
      ],
    );
  }

  getRow(int i) {
    return new GestureDetector(
      child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new Text("Row $i")),
      onTap: () {
        setState(() {
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
      },
    );
  }
}
