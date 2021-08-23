//被mixin(混入)的类不能有构造函数（多继承）
class A {
  void a() {
    print("A  的a方法!");
  }
}

class B {
  void b() {
    print("b方法");
  }

  void a() {
    print("B  的a方法!");
  }
}

class C with A, B {
  void c() {
    print("c方法");
  }

// 重写了 混入类的a方法
// void a() {}
}

void main() {
  //1、自身是第一优先级
  //2、如果自身没有对应的方法，就从with最右边开始查找方法
  var c = new C();
  c.a(); //当A、B中都有a方法时，混合顺序为A,B时，使用B类中的a方法；混合顺序为B,A时，使用A类中的a方法
  c.b(); //B 中的 b 方法
  c.c(); //自身类的 c 方法
}
