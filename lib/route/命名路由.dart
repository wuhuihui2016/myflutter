import 'package:flutter/material.dart';

void main() => runApp(MyApp());

///页面功能：
///1、实现命名路由的跳转页面[注册路由表:pushNamed]；
///2、页面切换时传值和接收值

///使用 '/'，则不可用 home: MainRoute()：
///If the home property is specified,_the routestable cannot inelude an entry for' "/", since itwould_be redundant._
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      ///注册路由表
      routes: {
        "/" :(context) => MainRoute(),
        "new_page": (context) => SecondRoute(),
      },
    );
  }
}

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
      ),
      body: Column(
        children: <Widget>[
          Text("第一个页面"),
          RaisedButton(
            onPressed: () async {
              ///导航到新路由
              /// result 接收到第二个页面回传的值
              var result = await Navigator.pushNamed(context, "new_page");
              debugPrint("返回:$result");
            },
            child: Text("进入第二页"),
          )
        ],
      ),
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
              ///路由pop弹出
              ///第二个页面回到第一个页面时，传值给第一个页面
              Navigator.pop(context, "结束");
            },
            child: Text("返回"),
          )
        ],
      ),
    );
  }
}