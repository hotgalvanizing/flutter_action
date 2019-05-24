//导入包。此行代码作用是导入了Material UI组件库。
// Material是一种标准的移动端和web端的视觉设计语言，
// Flutter默认提供了一套丰富的Material风格的UI组件。
import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_action/route1.dart';
import 'package:flutter_action/route2.dart';
import 'package:flutter_action/route3.dart';

void main() => runApp(MyApp());

/**
 * MaterialApp
 */
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page": (context) => NewRoute(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

/**
 * 首页
 */
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/**
 * 首页状态管理
 */
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      //输出到控制台
      print(_counter);

      debugPrint(_counter.toString());

      //debugger()语句采用一个可选when参数，您可以指定该参数仅在特定条件为真时中断
      debugger(when: _counter > 5);
    });
  }

  @override
  Widget build(BuildContext context) {

    //Scaffold包含：导航栏和Body以及FloatingActionButton(如果需要)
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        //TODO colume是一个什么样的weight
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("Route1：new route"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
//                Navigator.push(context,
//                    new MaterialPageRoute(builder: (content) {
//                  return new NewRoute();
//                }));
                debugDumpApp();
                Navigator.pushNamed(context, "new_page");
              },
            ),
            RandomWordsWidget(),
            Echo(
              text: "haha",
            ),
            FlatButton(
              child: Text("Route2：Test"),
              textColor: Colors.green,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return CounterWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("Route3:Test"),
              textColor: Colors.amber,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return TestRoute3();
                }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/**
 * 首页中的一个weight
 */
class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }
}

class Echo extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.grey,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}


