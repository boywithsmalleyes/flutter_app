import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;

  const CustomButton({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: null,
      child: new Text(label),
    );
  }
}
