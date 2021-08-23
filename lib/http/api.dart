import 'package:dio/dio.dart';
import 'package:wanandroid/http/http_manager.dart';

class Api {
  static const String baseUrl = "http://www.wanandroid.com/";

  //首页文章列表 http://www.wanandroid.com/article/list/0/json
  static const String ARTICLE_LIST = "article/list/";

  static const String BANNER = "banner/json";

  static getArticleList(int page) async {
    return HttpManager.getIntance().request('$ARTICLE_LIST$page/json');
  }

  static getBanner() async {
    return HttpManager.getIntance().request(BANNER);
  }
}

Future<void> main() async {
  var dio = Dio();
  Response response =
      await dio.get("http://www.wanandroid.com/article/list/0/json");
  print(response.data.toString());
}
