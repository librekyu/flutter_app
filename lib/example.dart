import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/cupertino_example.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HelloPage('title'));
  }
}

class HelloPage extends StatefulWidget {
  /// 변화 하지 않는 값들은 모두 여기에 정의
  /// 변화 하는 값들은 _HelloPageState 에 정의
  final String title;
  final String _qweqwes = '';

  HelloPage(this.title) : super(); // Constructor

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  String _message = "Hello World!";
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _changeMessage,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _message,
                style: TextStyle(fontSize: 30),
              ),
              Text('$_count', style: TextStyle(fontSize: 30)),
              MaterialButton(
                child: Text('to Cupertino'),
                onPressed: () => _toCupertinoPage(context),
              )
            ]),
      ),
    );
  }

  void _changeMessage() {
    setState(() {
      _message = _message == 'Hello world' ? '헬로 월드' : 'Hello world';
      _count++;
    });
  }

  /// page 이동
  void _toCupertinoPage(BuildContext context) {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => CupertinoPage()));
  }
}
