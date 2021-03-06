import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/local_storage.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    LocalStorage.getInt('_counter').then((int value) {
      setState(() {
        _counter = value ?? 0;
      });
    });
  }

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await LocalStorage.putInt('_counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          RaisedButton(
            onPressed: _incrementCounter,
            child: Text('Increment'),
          ),
        ],
      ),
    );
  }
}
