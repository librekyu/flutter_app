import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/example.dart';

class CupertinoPage extends StatefulWidget {
  @override
  _CupertinoPageState createState() => _CupertinoPageState();
}

class _CupertinoPageState extends State<CupertinoPage> {
  bool _switch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('Cupertino UI'),
        ),
        body: Column(
          children: <Widget>[
            CupertinoButton(
              child: Text('Cupertino Button'),
              onPressed: () => toMaterialPage(context),
            ),
            CupertinoSwitch(
              value: _switch,
              onChanged: (bool value) {
                setState(() {
                  _switch = value;
                });
              },
            )
          ],
        ));
  }
}

void toMaterialPage(BuildContext context) => {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HelloPage('from cupertino')))
    };
