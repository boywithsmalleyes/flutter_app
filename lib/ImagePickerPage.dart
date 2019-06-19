import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => new _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage();
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Image Picker"),
      ),
      body: Center(
        child: _image == null ? Text("No Image selected") : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "pick image",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
