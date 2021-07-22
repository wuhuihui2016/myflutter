//async 表示为一个异步方法, await必须在async方法中使用
//异步方法只能返回 void和Future
import 'dart:io';

// async 只能返回void与 Future
Future<String> readFile() async {
  //await 等待future执行完成再执行后续代码
  String content = await new File(r"E:\0721.txt").readAsString();
  String content2 = await new File(r"E:\0722.txt").readAsString();
  //自动转换为 future
  return "$content\n$content2";
}

void readFile2(void callback(s)) {
  String result = "";
  new File(r"E:\0721.txt").readAsString().then((s) {
    result += s;
    return new File(r"E:\0722.txt").readAsString();
  }).then((s) {
    result += ("\n$s");
  }).whenComplete(() {
    print(result);
    callback(result);
  });
}

void main() {
  // readFile().then((value) => print(value)); // await 实现排队读取文件，读完一个读下一个
  readFile2((s) {  print(s); }); // then 迭代实现排队读取文件，读完一个读下一个
}
