// 如果变量没有赋初值，则没办法使用？？！！

void main() {
  num j = 1;
  print(j.runtimeType); //获取变量类型
  //类型转换，用as
  int i = j as int;
  print(i.runtimeType);

  Object i1 = 1;
  print(i1.runtimeType); //获取变量类型
  if (i1 is int) {
    //判断变量类型，使用is
    print("not int type");
  }

  // String k = "123"; //变量在使用前必须赋值
  // k ??= "456"; //相当于 java 的 if (null == k)  k = "123";
  // // ??= 安全赋值符，如果k有值，则忽略，否则赋值为456；

  new Builder()..a()..b(); //级联操作符

}

class Builder {
  void a() {
    print("run on a method");
  }

  void b() {
    print("run on b method");
  }
}
