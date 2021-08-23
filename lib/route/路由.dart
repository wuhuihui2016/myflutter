import 'package:flutter/material.dart';

///存在问题：第一个页面显示空白
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SecondRoute();
  }
}

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("第一个页面",textDirection: TextDirection.ltr,),
        TextButton(
          onPressed: () {
            //导航到新路由
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondRoute();
            }));
          },
          child: Text("进入第二页",textDirection: TextDirection.ltr),
        )
      ],
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
      ),
      body: Column(
        children: <Widget>[
          Text("第一个页面"),
          RaisedButton(
            onPressed: () {
              //路由pop弹出
              Navigator.pop(context);
            },
            child: Text("返回"),
          )
        ],
      ),
    );
  }
}