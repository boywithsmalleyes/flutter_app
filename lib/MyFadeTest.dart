import 'package:flutter/material.dart';

//class MyFadeState extends State<>

class MyFadeTest extends StatefulWidget {
  const MyFadeTest({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return new MyFadeState();
  }
}

class MyFadeState extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curvedAnimation =
    new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Container(
          child: new FadeTransition(
            opacity: curvedAnimation,
            child: new FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        tooltip: "Fade",
        child: new Icon(Icons.brush),
      ),
    );
  }
}