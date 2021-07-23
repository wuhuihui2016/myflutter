import 'package:flutter/material.dart';

//手势
//点击Container时， GestureDetector会调用它的onTap回调， 在回调中，将消息打印到控制台。
//可以使用GestureDetector来检测各种输入手势，包括点击、拖动和缩放。
void main() => runApp(MyButton());

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('MyButton build!');
    return new GestureDetector(
      onTap: () {
        debugPrint('MyButton was tapped!');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0), //圆角弧度
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text(
            'Engage',
            textDirection: TextDirection.ltr, //出现No Directionality widget found. 增加文本显示方向
          ),
        ),
      ),
    );
  }
}
