import 'package:flutter/material.dart';

class TestRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("hello world"),
              Text("I am Jack"),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text("hello world"),
              Text("I am Jack"),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text("hello world",style: TextStyle(fontSize: 30.0),),
              Text("I am Jack"),
            ],
          ),


        ],
      ),
    );
  }
}


class TestColumn extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Column"),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,//有效
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max,//无效
                  children: <Widget>[
                    Text("hello world"),
                    Text("I am Jack"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
