import 'dart:io';

void main() {

  //TODO　1.读文件byte
  new File(r"D:\flutter_windows_2.2.3-stable.zip").readAsBytes().then((_){
    print("read stable"); //文件够大，等待文件读完再输出
  });

  //TODO　2.then 获取文件内容
  new File(r"E:\0722.txt").readAsString().then((s){
    print(s);
  });

  //TODO　3.写这个文件：将 stable 文件内容写入到 stable2，监听写入文件的进度
  var dst = new File(r"D:\flutter_windows_2.2.3-stable1.zip");
  var write = dst.openWrite();
  Stream<List<int>> stream =
      new File(r"D:\flutter_windows_2.2.3-stable.zip").openRead();
  var listen = stream.listen((s) {
    print("stream");
    write.add(s);
  });

  //替代掉listen的方法
  listen.onData((s) {
    print("strema2");
  });
  listen.onDone(() {
    print("读完整个文件");
  });
  listen.pause();
  listen.resume();
}
