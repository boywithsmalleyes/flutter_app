import 'package:flutter/material.dart';

class LifecycleWatcher extends StatefulWidget {
  @override
  _LifecycleWatcherState createState() => new _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<LifecycleWatcher>
    with WidgetsBindingObserver {
  AppLifecycleState _lastLifecycleState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    _lastLifecycleState = state;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_lastLifecycleState == null) {
      return new Text('This widget has not observed any lifecycle changes.',
          textDirection: TextDirection.ltr);
    }
    return new Text(
        'The most recent lifecycle state this widget observed was: $_lastLifecycleState.',
        textDirection: TextDirection.ltr);
  }
}
