import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class TestScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
        appBar: AppBar(
          title: Text("SingleChildScrollView"),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: str
                    .split("")
                    .map((c) => Text(
                          c,
                          textScaleFactor: 2.0,
                        ))
                    .toList(),
              ),
            ),
          ),
        ));
  }
}

class TestListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test ListView"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },
        itemCount: 100,
        itemExtent: 50.0,
      ),
    );
  }
}

class TestListViewSeparated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      color: Colors.green,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Test ListView"),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext c, int index) {
            return ListTile(
              title: Text("$index"),
            );
          },
          separatorBuilder: (BuildContext c, int index) {
            return index % 2 == 0 ? divider1 : divider2;
          },
          itemCount: 100),
    );
  }
}

class InfiniteListView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _InfiniteListViewState();
  }

}

class _InfiniteListViewState extends State<InfiniteListView>{

  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("无限加载列表"),),
      body: ListView.separated(
          itemBuilder: (context,index){
            //如果到了表尾
            if(_words[index] == loadingTag){

              if(_words.length - 1 < 100){
                //获取数据
                _retrieveData();
                //加载显示loading
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0,),
                  ),
                );
              }else{
                //不再获取数据
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text("没有更多了",style: TextStyle(color: Colors.amber),),
                );
              }

            }
            //显示单词列表项
            return ListTile(title: Text(_words[index]),);
          },
          separatorBuilder: (context,index) => Divider(height: 0,),
          itemCount: _words.length),
    );
  }

  void _retrieveData () {
    Future.delayed(Duration(seconds: 2)).then((e){
      _words.insertAll(_words.length-1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });



  }

}

class ListViewWithHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListViewHeader"),),
      body: Column(
        children: <Widget>[
          ListTile(title: Text("商品列表")),
          Expanded(
            child: ListView.builder(
                itemBuilder: (BuildContext c,int index){
                  return ListTile(title: Text("$index"));
                }),
          )
        ],
      ),
    );
  }

}