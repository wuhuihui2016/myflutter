void main() {
  print("hello");
  Object i = "whh";
  var j = "abc";
  //j = 100; // var 修饰的 j 变量在赋值时已经确定了字符串类型，因此不可在赋值为其它类型

  dynamic z = "zzz";
  print(z);
  z = 100; // dynamic 修饰的变量为动态类型变量，可赋值任意类型值
  print(z);

  final f = 1; //final 修饰的变量同 java，不能重新赋值

  const c = 1; //const 修饰的变量不能重新赋值

  const cc = c + 1; //const 修饰的变量在运行时确定，即可以使用一个确定的值，为其赋值

  final ff = cc; //final 修饰的变量在编译时确定，也可使用一个确定的值，为其赋值

  print("list变量输出");
  var list = [1,2,3];
  list.forEach(print);
  print("list变量输出方法二");
  var p = print;
  list.forEach(p);
}
