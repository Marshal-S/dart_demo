//dart编程语言函数介绍类，到类里面还会有扩展

//和 java 的函数比较像

//函数的基本声明方式
//无参，无返回值
import 'dart:async';
import 'dart:math';

void getUserInfo() {
}
//无参的可简化返回值效果
getUserInfo1() {
}

//带参的函数
getUserInfoByToken(String token) {
}

//参数带?的函数,可以理解为可选参数,除了指定类型，可以传null
getUserInfoByToken1(String? token) {
}

//带参带返回值
List getUserInfiByToken1(String token) {
  return [];
}
//设置返回类型
List<String> getUserInfiByToken2(String token) {
  return ["啦啦啦"];
}

//重命名,或者声明一个闭包类型，与平常的不一样名字就在返回值和参数中间，作为参数也一样
typedef void blockType(int num);

testBlock() {
  //无参无返回值闭包函数
  var block = () {
    print(123);
  };
  block();

  //带参有返回值的
  var block1 = (num) {
    return num + 1;
  };
  var result = block1(10);
  print(result);


  //带箭头的，简化操作，有点兼容js箭头函数的意思
  var block2 = (num) => pow(num, 2);
  var result2 = block2(14);
  print(result2);

  var block3 = (str) => {
    print("哈哈哈:${str}")
  };
  block3("哎呀");
}

//传递闭包参数，加上？表示可选，(闭包的参数名在中间，因此？写到最后)
requestUserTokenByCompleted(void completed(String? userToken)?) {
  Timer(Duration(seconds: 2), () {
    if (completed != null) {
      completed(DateTime.now().microsecondsSinceEpoch % 5 > 2 ? 'abc' : null );
    }
  });
}

//闭包函数
void main() {
    testBlock();

    requestUserTokenByCompleted((token) {
      print("获取用户信息成功了,token:${token}");
    });

    requestUserTokenByCompleted((token) {
      print("获取用户信息成功了,token:${token}");
    });

    requestUserTokenByCompleted(null);
}


