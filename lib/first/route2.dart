import 'package:flutter/material.dart';

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