//导入包。此行代码作用是导入了Material UI组件库。
// Material是一种标准的移动端和web端的视觉设计语言，
// Flutter默认提供了一套丰富的Material风格的UI组件。
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_action/first/route1.dart';
import 'package:flutter_action/first/route10.dart';
import 'package:flutter_action/first/route11.dart';
import 'package:flutter_action/first/route12.dart';
import 'package:flutter_action/first/route2.dart';
import 'package:flutter_action/first/route3.dart';
import 'package:flutter_action/first/route4.dart';
import 'package:flutter_action/first/route5.dart';
import 'package:flutter_action/first/route6.dart';
import 'package:flutter_action/first/route7.dart';
import 'package:flutter_action/first/route8.dart';
import 'package:flutter_action/first/route9.dart';
import 'package:flutter_action/review/reviewroute.dart';

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
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page": (context) => NewRoute(),
      },
      home: MyHomePage(title: 'Home Page'),
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
  var test = 0;

  void _incrementCounter() {
    setState(() {
//      test = "你好";
      _counter++;
      //输出到控制台
      print(_counter);
      debugPrint(_counter.toString());
      //debugger()语句采用一个可选when参数，您可以指定该参数仅在特定条件为真时中断
//      debugger(when: _counter > 5);
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
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("Review"),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => ReviewRoute()));
                  },
                ),
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme
                      .of(context)
                      .textTheme
                      .display1,
                ),
                FlatButton(
                  child: Text("Route1：test new route"),
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
                  child: Text("Route3:Test State"),
                  textColor: Colors.amber,
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return TestRoute3();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route4:Test Cupertino"),
                  textColor: Colors.grey,
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return CupertinoTestRoute();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route5:布局Weight-Row"),
                  textColor: Colors.amberAccent,
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return TestRow();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route5:布局Weight-Column"),
                  textColor: Colors.amberAccent,
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return TestColumn();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route6:Flex"),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return TestFlex();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route7:ScrollView"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return TestScrollView();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route8:ListView"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return TestListView();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route9:ListViewSeparated"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return TestListViewSeparated();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route10:动态上拉列表"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return InfiniteListView();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route11:ListViewHeader"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return ListViewWithHeader();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route12:ScrollControler"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return ScrollControlerTest();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route13:ScrollNotification"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return ScrollNotificationTestRoute();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route14:FileOperationRoute"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return FileOperationRoute();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route15:HttpTestRoute"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return HttpTestRoute();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route16:DioTestRoute"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return DioTestRoute();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route17:WebSocketRoute"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return WebSocketRoute();
                        }));
                  },
                ),
                FlatButton(
                  child: Text("Route12:ScrollControler"),
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                          return ScrollControlerTest();
                        }));
                  },
                ),
              ],
            ),
          ),
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
