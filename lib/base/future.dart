import 'dart:io';
//Future实现异步串行多个任务
void main() {

  // then：可以得到Future的结果并且能够返回一个新的Future
  Future<String> then = new File(r"E:\0721.txt").readAsString()
      .then((String s) {
    //返回void 或者Future
    print(s);
    return "then get result!";
  });
  then.then((String i) {
    print(i);
  });
  //UI操作通过then可以完成有序任务的执行，一个任务执行完成之后，下一个任务根据上个任务的结果 执行不同的操作

  //如果需要一组任务都执行完毕之后 再统一执行相同的一些处理
  Future.wait([Future.delayed(Duration(seconds: 1)),Future.delayed(Duration
    (seconds: 1))]).then((_){
    print("wait==>1");
  });

  Future.forEach([1,2,3,4],(i){
     print("forEach==>$i");
  });

}
