import 'package:dio/dio.dart';
import 'package:wanandroid/http/api.dart';

class HttpManager {
  Dio _dio;

  static HttpManager _instance;

  factory HttpManager.getIntance() {
    if (null == _instance) {
      _instance = new HttpManager._internal();
    }
    return _instance;
  }

  HttpManager._internal() {
    BaseOptions options = new BaseOptions(
      baseUrl: Api.baseUrl, //基础地址
      connectTimeout: 5000, //连接服务器超时时间，单位是毫秒
      receiveTimeout: 3000, //读取超时
    );
    _dio = new Dio(options);
  }

  request(url, {String method = "get"}) async {
    try {
      Options options = new Options(method: method);
      Response response = await _dio.request(url, options: options);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
