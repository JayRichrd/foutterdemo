import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = '自定义主题';
    return MaterialApp(
      title: 'http请求示例',
//      theme: new ThemeData(
//        brightness: Brightness.light,
//        primaryColor: Colors.lightGreen[600],
//        accentColor: Colors.orange[600],
//      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('http请求'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              const url = 'http://www.baidu.com';
              http.get(url).then((response) {
                print("状态：${response.statusCode}");
                print("正文：${response.body}");
              });
            },
            child: Text('发起http请求'),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
      body: new Center(
        child: new Container(
          color: Theme
              .of(context)
              .accentColor,
          child: new Text(
            '带有背景颜色的文本组件',
            style: Theme
                .of(context)
                .textTheme
                .title,
          ),
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.green),
          child: new FloatingActionButton(
            onPressed: null,
            child: new Icon(Icons.computer),
          )),
    );
  }
}
