import 'package:flutter/material.dart';

//stateless widget 没有内部状态，
//    Icon、IconButton, 和Text都是无状态widget, 它们都是 StatelessWidget的子类。
//    是不可变的，所有属性值都是最终的，如果子widget是stateful widget的，则该子widget是可以更改状态的。
//stateful widget 是动态的，用户可以和其交互（例如输入一个表单、 或者移动一个slider滑块），或者可以随时间改变 （也许是数据改变导致的UI更新）。Checkbox, Radio, Slider, InkWell, Form, and TextField 都是 stateful widgets, 它们都是 StatefulWidget的子类。
//    StatefulWidget 在调用 setState 方法更新数据后，会触发视图的销毁和重建，也将间接地触发其每一个子 Widget 的销毁和重建。大大降低了渲染性能。

//间隔两秒后，更新UI
void main() => runApp(MyApp2());

class MyApp extends StatelessWidget {
  String data = "开心的狒狒";

  MyApp() {
    Future.delayed(Duration(seconds: 5)).then((s) {
      this.data = "开心的狒狒啊~~~";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("哈哈"),
          ),
          body: Center(
            child: Text(data),
          )),
    );
  }
}

//使用State刷新UI
class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  String data = "开心的狒狒";

  _MyApp2State() {
    Future.delayed(Duration(seconds: 5)).then((s) {
      this.data = "开心的狒狒啊~~~";
      //修改状态 updateState  刷新ui，重绘，调用build方法
      setState(() {
        debugPrint("222222");
      });
    });

    //不允许在构造方法中setState，因为State都还没有，如何刷新？
    // setState(() {
    //   debugPrint("222222");
    // });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build=======");
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("哈哈"),
          ),
          body: Center(
            child: Text(data),
          )),
    );
  }
}
//===========================间隔两秒后，更新UI===========================//
