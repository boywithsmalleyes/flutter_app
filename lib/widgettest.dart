import 'package:flutter/material.dart';

//void main() => runApp(MyApp());




class SampleAppPage extends StatefulWidget {
  @override
  createState() => new SampleState();
}

class SampleState extends State<SampleAppPage> {
  String textToShow = "I like Flutter";
  int count = 0;

  bool toggle = true;

  void _toggle(){
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild(){
    if(toggle) {
      return new Text ("Toggle One");
    } else {
      return new MaterialButton(onPressed: null, child: new Text("Toggle Two"));
    }
  }

  void _updateText(){
    setState((){
      textToShow = "Flutter is Awesome ${count}" ;
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
        child: _getToggleChild(),
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
