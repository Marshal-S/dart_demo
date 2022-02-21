//dart编程语言异步方法介绍类
//有些操作比较耗时，此时需要用到异步操作
//与 js和ts等使用方法一样，使用 async 和 await来处理

import 'dart:async';

//声明一个异步方法
Future<bool> simulateOperate() async {
  //假设这一有一些非常耗时的操作逻辑，例如对本地数据整理
  var num = 0;
  for(var i = 0; i < 10000000; i++) {
    num++;
  }
  print('我的异步任务执行完毕了--${num}');
  return true;
}

//执行一个同步方法调用，会发现，此异步任务执行正常
void test() {
  print('开启test同步方法');
  var res = simulateOperate(); //通过打印可以看到这里返回的是函数指针，异步任务结果这里已经忽略了
  print('我是test同步方法,执行完毕了:${res}');
}

//必须在有async的函数下使用 await,能够等待异步任务执行结果，另外没有返回值时可以省略 Future
testAwait2() async {
  print('开启testAwait2异步方法');
  var res = await simulateOperate(); //之而立返回的是true
  print('我是testAwait2异步方法方法,执行完毕了：${res}');
}

void main() {
  print("总体任务开始");
  test();
  print("第一个测试完毕");
  testAwait2();
  print("第二个测试完毕");
}

//await 总是要搭配 async 使用的
//通过打印可以看出单纯的 async 说是异步，只是给函数支持了异步功能，实际并没有异步执行

//当在 async 函数中，使用 await 等待一个 async异步函数执行结果时,
//执行到 await 时，会开始异步执行，并阻塞当前函数等待结果，切换上一个函数栈继续往后执行
//可以理解为，这个函数阻塞后自己开启异步线程自己执行自己的，其他的代码继续往后顺序执行

//ps: js、ts中的 async、await 也差不多，可以去试试

//打印结果
// I/flutter ( 5664): 总体任务开始
// I/flutter ( 5664): 开启test同步方法
// I/flutter ( 5664): 我的异步任务执行完毕了--1000000000
// I/flutter ( 5664): 我是test同步方法,执行完毕了:Instance of 'Future<bool>'
// I/flutter ( 5664): 第一个测试完毕
// I/flutter ( 5664): 开启testAwait2异步方法
// I/flutter ( 5664): 我的异步任务执行完毕了--1000000000
// I/flutter ( 5664): 第二个测试完毕
// I/flutter ( 5664): 我是testAwait2异步方法方法,执行完毕了：true









