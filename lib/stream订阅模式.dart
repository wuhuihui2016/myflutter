import 'dart:io';

void main() {
  Stream<List<int>> stream =
      new File(r"D:\flutter_windows_2.2.3-stable.zip").openRead();
  //两个订阅者会报错
//  var listen = stream.listen((s){
//
//  });

//  stream.listen((s){
//
//  });

  //广播模式：可以多订阅
  var broadcastStream = stream.asBroadcastStream();
  broadcastStream.listen((_) {
    print("listen1");
  });
  broadcastStream.listen((_) {
    print("listen2");
  });
}
