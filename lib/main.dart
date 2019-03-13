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
      home: TextContainerDemo(),
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

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552456810628&di=29016e3770f818c44c7c82084455d577&imgtype=0&src=http%3A%2F%2Fpic5.nipic.com%2F20091223%2F3279936_153719006353_2.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class TextContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('文本组件'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            '红色+黑色删除线+25号',
            style: TextStyle(
              color: const Color(0xffff0000),
              decoration: TextDecoration.lineThrough,
              decorationColor: const Color(0xff000000),
              fontSize: 25.0,
            ),
          ),
          Text(
            '橙色+黑色删除线+25号',
            style: TextStyle(
              color: const Color(0xffff9900),
              decoration: TextDecoration.underline,
              fontSize: 25.0,
            ),
          ),
          Text(
            '虚线上划线+25号+倾斜',
            style: TextStyle(
                decoration: TextDecoration.overline,
                decorationStyle: TextDecorationStyle.dashed,
                fontSize: 25.0,
                fontStyle: FontStyle.italic),
          ),
          Text(
            '加粗+25号',
            style: TextStyle(
                fontSize: 25.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 6.0),
          ),
        ],
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
