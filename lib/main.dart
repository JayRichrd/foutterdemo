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
      title: '容器组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('容器组件示例'),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 8.0,
              ),
              borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
            ),
            child: Text(
              'Text',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
      ),
    );
  }

  /**
   *
   */
  void getWeatherData() async {
    try {
      // 1.实例化一个HttpClient对象
      HttpClient httpClient = new HttpClient();
      // 2.发起http请求
      HttpClientRequest httpRequest = await httpClient.getUrl(
          Uri.parse("http://t.weather.sojson.com/api/weather/city/101030"));
      // 3.等待服务器返回数据
      HttpClientResponse httpResponse = await httpRequest.close();
      var result = await httpResponse.transform(utf8.decoder).join();
      print(result);
      // 4.关闭httpClient
      httpClient.close();
    } catch (e) {
      print("请求失败：$e");
    } finally {}
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
      body: new Center(
        child: new Container(
          color: Theme.of(context).accentColor,
          child: new Text(
            '带有背景颜色的文本组件',
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
      floatingActionButton: new Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.green),
          child: new FloatingActionButton(
            onPressed: null,
            child: new Icon(Icons.computer),
          )),
    );
  }
}
