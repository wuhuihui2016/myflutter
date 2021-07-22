import 'dart:isolate';

//dart为单线程，isolate 相当于线程，Isolate可以实现异步并行多个任务
//isolate 与线程的区别就是线程与线程之间是共享内存的，而 isolate 和 isolate 之间是内存不共享的，所以叫 isolate (隔离)
//因此也不存在锁竞争问题，两个Isolate完全是两条独立的执行线，且每个Isolate都有自己的事件循环，它们之间只能通过发送消息通信，所以它的资源开销低于线程。
int i = 0; //该变量的值更改

void main() {
  i = 10;
  // TODO 1.创建一个消息接收器：简单接收和监听消息
  print("TODO 1.简单接收和监听消息");
  var receivePort1 = new ReceivePort();
  receivePort1.sendPort.send("1");
  receivePort1.sendPort.send("2");
  receivePort1.sendPort.send(1);
  receivePort1.listen((t) {
    print("接收到消息！$t");
  });
  // receivePort.close(); //在正确的时机关闭


  // TODO 2.创建一个消息接收器：接收到子 isolate 的消息
  var receivePort2 = new ReceivePort("receivePort2");
  Isolate.spawn(entryPoint, receivePort2.sendPort); //关联子 isolate
  receivePort2.listen((t) {
    print("接收到entryPoint发过来的消息！$t");
  });

}

//相当于 java 中的一个子线程
void entryPoint(SendPort sendPort) {
  // i = 100;
  // print(i); //100

  //通过方法参数中的 sendPort 给主 isolate 发送消息
  sendPort.send(sendPort);
  sendPort.send(i); //即使变量 i 是全局变量，在此方法中与主 isolate 隔离，数据不共享
  sendPort.send("1");

  //通过自己的 sendPort 只能给自己传输消息
  var receivePort = new ReceivePort();
  var sendPort2 = receivePort.sendPort;
  sendPort2.send("sendPort2-1");
  sendPort2.send("sendPort2-2");
  sendPort2.send("sendPort2-3");
  receivePort.listen((t) {
    print("entryPoint接收到自主发出的消息！$t");
  });

}
