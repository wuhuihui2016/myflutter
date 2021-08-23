void fun(Function f) {
  f(1);
}

void fun3(void f1(int i, int j)) {}

typedef String F(int i, int j);

String fun2(F f) {
  return f(1, 1);
}

void main() {
  Function f = fun; //方法可作为对象，赋值给Function变量

  f((int i, int j) {
    //匿名方法，lambda表达式，closure闭包
    return 1;
  });

  fun2((i, j) => "1");
  
  Buttom1 buttom1 = new Buttom1();
  var onClick;
  buttom1.setOnClickListener(onClick); //TODO　不懂怎么传参，怎么实现onClick方法
}

//定义回调方法
typedef void onClick();

class Buttom1 {
  void setOnClickListener(onClick listener) {
    listener();
  }
}
