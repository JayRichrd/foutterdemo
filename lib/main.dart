import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() =>
    runApp(MyApp(items: List<String>.generate(500, (i) => "Item $i")));

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appName = '自定义主题';
//    return MaterialApp(
//      title: 'Flutter Demo',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('长列表'),
//        ),
//        body: ListView.builder(
//          itemCount: items.length,
//          itemBuilder: (context, index) {
//            return ListTile(
//              leading: Icon(Icons.phone),
//              title: Text('${items[index]}'),
//            );
//          },
//        ),
//      ),
//    );
    return MaterialApp(
      home: GridDemoLayout(),
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

class GridDemoLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('网格组件'),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 30.0,
          crossAxisCount: 4,
          children: <Widget>[
            const Text('第一行第一列'),
            const Text('第一行第一列'),
            const Text('第一行第一列'),
            const Text('第一行第一列'),
            const Text('第一行第一列'),
            const Text('第一行第一列'),
            const Text('第一行第一列'),
            const Text('第一行第一列'),
            const Text('第一行第一列'),
            const Text('第一行第一列'),
            const Text('第一行第一列'),
            const Text('第一行第一列'),
            const Text('第一行第一列'),
          ],
        ),
      ),
    );
  }
}

class HorizontalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '水平列表',
      home: Scaffold(
        appBar: AppBar(
          title: Text('水平列表'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.lightBlue,
              ),
              Container(
                width: 160.0,
                color: Colors.amber,
              ),
              Container(
                width: 160.0,
                child: Column(
                  children: <Widget>[
                    Text(
                      '水平',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                    Text(
                      '列表',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '容器组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('基础列表'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('AirPlay'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ),
      ),
    );
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

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('图标组件示例')),
        body: Center(
          child: IconButton(
            icon: Icon(
              Icons.volume_up,
              size: 50,
            ),
            tooltip: '按下操作',
            onPressed: () {
              print('按下操作');
            },
          ),
        ));
  }
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
