

import 'package:flutter/material.dart';

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