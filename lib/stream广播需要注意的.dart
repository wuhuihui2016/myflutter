import 'dart:async';
import 'dart:io';

void main() {
  var stream = Stream.fromIterable([1, 2, 3, 4]);
  //由单订阅转换成广播，实现多订阅
  var broadcastStream = stream.asBroadcastStream();

  broadcastStream.listen((i) {
    print("111111111：${i}");
  });

  broadcastStream.listen((i) {
    print("222222222：${i}");
  });

  //===========================
  //直接创建一个广播
  var streamController = StreamController.broadcast();
  //发送一条广播
  streamController.add("1");

  //不能获得数据
  streamController.stream.listen((i) {
    print("广播333333:" + i);
  });
  streamController.close();
  //============================

}
