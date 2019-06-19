import 'package:flutter/material.dart';


class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => new _TextPageState();
}

class _TextPageState extends State<TextPage> {

  String _errorText;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Text Page"),
      ),
      body: new Center(
        child: new TextField(
          onSubmitted: (String text) {
            setState(() {
              if (!isEmail(text)) {
                _errorText = "Error: This is not an email";
              } else {
                _errorText = null;
              }
            });
          },
          decoration: new InputDecoration(
            hintText: "This is a hint",
            errorText: _getErrorText()
          ),
        ),
      ),
    );
  }
  _getErrorText(){
    return _errorText;
  }

  isEmail(String em) {
    String emailRegexp= r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(emailRegexp);

    return regExp.hasMatch(em);
  }
}