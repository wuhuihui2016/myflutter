import 'dart:async';

///stream 广播扩展练习：实现 EventBus 事件发布-订阅总线
void main() {
  EventBus.getDefault().regiest((s) {
    print("全类型注册:$s");
  });

  EventBus.getDefault().regiest<String>((s) {
    print("字符串注册:$s");
  });

  EventBus.getDefault().regiest<int>((s) {
    print("int注册:$s");
  });

  EventBus.getDefault().post("哈哈");
  EventBus.getDefault().post(1);
  EventBus.getDefault().post(10086.11);
}

class EventBus {
  static EventBus _instance;
  StreamController _streamController;

  factory EventBus.getDefault() {
    return _instance ??= EventBus._internal();
  }

  EventBus._internal() {
    _streamController = StreamController.broadcast();
  }

  StreamSubscription<T> regiest<T>(void onData(T event)) {
    //没有指定类型，全类型注册
    if (T == dynamic) {
      return _streamController.stream.listen(onData);
    } else {
      //筛选出类型为 T 的数据，获得只包含 T 的 Stream
      Stream<T> stream = _streamController.stream.where((type) => type is T)
          .cast<T>();
      return stream.listen(onData);
    }
  }

  void post(event) {
    _streamController.add(event);
  }

  void destroy() {
    _streamController.close();
  }

}