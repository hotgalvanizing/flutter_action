//导入包。此行代码作用是导入了Material UI组件库。
// Material是一种标准的移动端和web端的视觉设计语言，
// Flutter默认提供了一套丰富的Material风格的UI组件。
import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    //Scaffold包含：导航栏和Body以及FloatingActionButton(如果需要)
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
              child: Text("new route"),
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
              child: Text("Test"),
              textColor: Colors.green,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return CounterWidget();
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
 * 一个新的路由
 */
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New route")),
      body: Center(child: Text("this is the new route")),
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

/**
 *
 */
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

class CounterWidget extends StatefulWidget {
  final int initValue;

  const CounterWidget(
      {Key key,
      //TODO :0 是什么意思？
      this.initValue: 0});

//  @override
//  State<StatefulWidget> createState() {
//    return _CounterWidgetState();
//  }
  @override
  State<StatefulWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return new Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: Center(
          child: FlatButton(
            child: Text('$_counter'),
            //点击后计数器自增
            onPressed: () => setState(
                  () => ++_counter,
                ),
          ),
        ));
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  State<TapboxA> createState() {
    return new _TapboxAState();
  }
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
