
//类的定义,如果类名以_开头，则该类为private类
class Point {
  late int a; //如果变量名以_开头，则该变量为private变量
  late int b;
  late int _c; //如果变量名以_开头，则该变量为private变量
  late int _d;


  Point();

  //Point(this.a, this.b); //构造方法(如果变量为私有的，则不可拿来构造)。
  //如果默认的无参构造方法被定义，则不可再有其他构方法，但是可定义为命名构造方法

  //命名构造方法
  Point.whh(int b) { //必须将变量用late修饰
    this.b = b;
    print("whh 构造！");
  }

  //私有变量才可有set、get方法
  int get d => _d;

  set d(int value) {
    _d = value;
  }

  int get c => _c;

  set c(int value) {
    _c = value;
  }

  //运算符重载， 定义+ 操作的行为
  Point operator +(Point othre){
    var point = new Point();
    point._c = _c + othre.c;
    return point;
  }
  String operator -(int x){
    return "hahahaha";
  }
}

void main() {
  var point = new Point.whh(1); //调用命名构造方法

  var p1 = Point();
  var p2 = Point();
  p1.a = 10;
  p2.b = 20;
  var p3 = p1 + p2;
  p3 = p1 + p2 + p3;

  print(p3.c);

  //灵活......
  String str = p3 - 1;
  print(str);

}
