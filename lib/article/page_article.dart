import 'package:banner_view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:wanandroid/article/webview_page.dart';
import 'package:wanandroid/http/api.dart';

import 'article_item.dart';
import 'details_page.dart';

///请求 banner 图和 文章列表数据后显示
class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  ///滑动控制器
  ScrollController _controller = new ScrollController();

  ///控制正在加载的显示
  bool _isHide = true;

  //请求到的文章数据
  List articles = [];

  ///banner 图
  List banners = [];

  ///总文章数有多少
  var totalCount = 0;

  ///分页加载，当前页码
  var curPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      ///获得 SrollController 监听控件可以滚动的最大范围
      var maxScroll = _controller.position.maxScrollExtent;

      ///获得当前位置的像素值
      var pixels = _controller.position.pixels;

      if (maxScroll == pixels && curPage < totalCount) {
        _getArticlelist();
      }
    });

    ///请求文章列表与banner图
    _pullToRefresh();
  }

  _getArticlelist([bool update = true]) async {
    ///请求成功是map，失败是null
    var data = await Api.getArticleList(curPage);
    if (data != null) {
      var map = data['data'];
      var datas = map['datas'];

      ///文章总数
      if (curPage == 0) {
        articles.clear();
      }

      curPage++;
      articles.addAll(datas);

      ///更新UI
      if (update) {
        setState(() {});
      }
    }
  }

  _getBanner([bool update = true]) async {
    var data = await Api.getBanner();
    if (data != null) {
      banners.clear();
      banners.addAll(data['data']);
      if (update) {
        setState(() {});
      }
    }
  }

  ///下拉刷新
  Future<void> _pullToRefresh() async {
    curPage = 0;

    ///组合两个异步任务，创建一个都完成后的新的Future
    Iterable<Future> futures = [_getArticlelist(), _getBanner()];
    await Future.wait(futures);
    _isHide = false;
    setState(() {});
    return null;
  }

  ///布局
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Offstage(
          offstage: !_isHide,
          child: new Center(
            ///加载数据的进度圈
            child: CircularProgressIndicator(),
          ),
        ),

        ///内容
        Offstage(
          offstage: _isHide,

          ///SwipeRefresh 下拉刷新组件
          child: new RefreshIndicator(
              child: ListView.builder(

                  ///条目数 +1代表了banner的条目
                  itemCount: articles.length + 1,

                  ///adapter条目item 视图生成方法
                  itemBuilder: (context, i) => _buildItem(i)),
              onRefresh: _pullToRefresh),
        )
      ],
    );
  }

  Widget _buildItem(int i) {
    if (i == 0) {
      ///Container ：容器
      return new Container(
        ///MediaQuery.of(context).size.height: 全屏幕高度
        height: MediaQuery.of(context).size.height * 0.3,
        child: _bannerView(),
      );
    }
    var itemData = articles[i - 1];
    return InkWell(
      child: ArticleItem(itemData),
      onTap: () {
        ///跳转文章详情页
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return DetailsPage(itemData);
        }));
      },
      //点击效果：水波纹
      splashColor: Colors.red,
    );
  }

  Widget _bannerView() {
    ///map 转换，将list中的每一个条目执行 map 方法参数接收的这个方法，这个方法返回T类型
    ///map方法最终返回一个 Iterable<T>
    List<Widget> list = banners.map((item) {
      return InkWell(
        child: Image.network(item['imagePath'], fit: BoxFit.cover),
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return WebViewPage(item);
          }));
        },
        //点击效果：水波纹
        splashColor: Colors.red,
      );

      /// 由于解析json获取图片路径不正确，出现了
      /// 'package:flutter/src/painting/_network_image_io.dart': Failed assertion: line 25 pos 14: 'url != null': is not true.
    }).toList();

    return list.isNotEmpty
        ? BannerView(
            list,

            ///控制轮播时间
            intervalDuration: const Duration(seconds: 3),
          )
        : null;
  }

  @override
  void dispose() {
    _controller.dispose(); //释放资源
    super.dispose();
  }
}
