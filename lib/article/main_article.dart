import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page_article.dart';

void main() {
  // runApp(new ArticlePage()); 必须用MaterialApp包裹，且确定显示样式
  runApp(new ArticleApp());
}

class ArticleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            '文章',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: new ArticlePage(),
      ),
    );
  }
}
