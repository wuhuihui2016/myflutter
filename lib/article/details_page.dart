import 'package:flutter/material.dart';

///文章详情页
class DetailsPage extends StatelessWidget {
  final itemData;

  const DetailsPage(this.itemData);

  @override
  Widget build(BuildContext context) {
    ///时间和作者
    Row author = new Row(
      ///水平线性布局
      children: <Widget>[
        //最后摆放，相当于 Linearlayout 的 weight 权重
        new Expanded(
            child: Text.rich(TextSpan(children: [
          TextSpan(text: "作者："),
          TextSpan(
              text: itemData['author'],
              style: new TextStyle(color: Theme.of(context).primaryColor))
        ]))),
        new Text(itemData['niceDate'])

        ///时间
      ],
    );

    ///标题
    Text title = new Text(
      itemData['title'],
      style: new TextStyle(fontSize: 16.0, color: Colors.black),
      textAlign: TextAlign.left,
    );

    ///章节名
    Text chapterName = new Text(
      itemData['chapterName'],
      style: new TextStyle(color: Theme.of(context).primaryColor),
    );

    Column column = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: author,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: title,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: chapterName,
        ),
      ],
    );

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            itemData['title'],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: column,
      ),
    );
  }
}
