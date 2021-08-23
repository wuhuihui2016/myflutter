//处理异常类型时，哪个类型最匹配，处理哪个

void test() {
  throw "出错了，5555";
}

int test1(int i) {
  if (i == 0) {
    throw "1";
  } else if (i == 1) {
    throw print; //万物皆可抛
  }
  return 0;
}

void main() {
  try {
    test();
  } catch (e, s) {
    //e：抛出的异常对象
    print(e); //出错了，5555
    print(e.runtimeType); //string

    //s：StackTrace 调用栈信息
    print(s);
    print(s.runtimeType); //_StackTrace
  }

  print("\n>>>处理不同的异常类型<<<");
  try {
    test();
  } on Exception catch (e, s) {
    print("Exception");
  } on int catch (e, s) {
    print("int");
  } on String catch (e, s) {
    print("String");
  }

  print("\n>>>处理Function异常类型<<<");
  try {
    int r = test1(1);
    if (r == 1) {}
  } on Function catch (e) {
    e("11111"); //显然Function比String更贴近异常类型
  } on String catch (e) {
    print("String");
  }
}
