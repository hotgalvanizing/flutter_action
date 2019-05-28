import 'package:flutter/material.dart';

class ScrollControlerTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollControlerTestState();
  }
}

class ScrollControlerTestState extends State<ScrollControlerTest> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //避免内存泄漏
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("滚动控制"),
        ),
        body: Scrollbar(
            child: ListView.builder(
                itemCount: 100,
                itemExtent: 50.0,
                controller: _controller,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                  );
                })),
        floatingActionButton: !showToTopBtn
            ? null
            : FloatingActionButton(
                child: Icon(Icons.arrow_upward),
                onPressed: () {
                  //返回顶部时执行动画
                  _controller.animateTo(.0,
                      duration: Duration(microseconds: 200),
                      curve: Curves.ease);
                },
              ));
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollNotificationTestRouteState();
  }
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollNotification"),
      ),
      body: Scrollbar(
          child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification n) {
                double progress = n.metrics.pixels / n.metrics.maxScrollExtent;
                setState(() {
                  _progress = "${(progress * 100).toInt()}%";
                });
                print("BottomEdge: ${n.metrics.extentAfter == 0}");
              },
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ListView.builder(
                      itemCount: 100,
                      itemExtent: 50.0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("$index"),
                        );
                      }),
                  CircleAvatar(
                    radius: 30.0,
                    child: Text(_progress),
                    backgroundColor: Colors.black54,
                  )
                ],
              ))),
    );
  }
}
