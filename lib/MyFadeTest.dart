import 'package:flutter/material.dart';
import 'package:flutter_app/CustomButton.dart';

//class MyFadeState extends State<>
/*
 * 动画，淡入
 */
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

  bool _toggle = false;

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
              size: 100.0,ªªª
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          if (_toggle) {
            controller.forward();
          } else {
            controller.reverse();
          }
          _toggle = !_toggle;
        },
        tooltip: "Fade",
//        child: new Icon(Icons.brush),
        child: new CustomButton(label: "按钮"),
      ),
    );
  }
}
