import 'package:flutter/material.dart';

import 'reviewroute1.dart';

class ReviewRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ReviewFlutter"),),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text("1、计数器案例"),
                onPressed:()=> Navigator.push(context,MaterialPageRoute(builder: (context) => ReviewRoute1())),
                textColor: Colors.deepPurple,
              )
            ],
          ),
        ),
      ),
    );
  }

}