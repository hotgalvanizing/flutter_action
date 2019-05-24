import 'package:flutter/material.dart';

class TestRoute3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestRouteState();
  }
}

class _TestRouteState extends State<TestRoute3> {
  bool _bactive = false;
  bool _cactive = false;

  void _handleTapBBoxChanged(bool newValue) {
    setState(() {
      _bactive = newValue;
    });
  }

  void _handleTapCBoxChanged(bool newValue) {
    setState(() {
      _cactive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TapboxA(),
            TapboxB(
              active: _bactive,
              onChanged: _handleTapBBoxChanged,
            ),
            TapboxC(active: _cactive,onChanged: _handleTapCBoxChanged,),
          ],
        ),
      ),
    );
  }
}

/**
 * 自身管理状态
 */
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
        width: 50.0,
        height: 50.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

/**
 * 父布局管理状态
 */
class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;

  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 50.0,
        height: 50.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  final bool active;

  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() {
    return _TapboxCState();
  }

  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'active' : 'inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 50.0,
        height: 50.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
