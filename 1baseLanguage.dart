//dart编程语言基础介绍类


//使用库,必须要写到最上面
import 'dart:async';
import 'dart:html';
//导入数学库
import 'dart:math';
//导入内置的文件,导入某个项目文件，使用相对路径
import './4class.dart'; 
//正常使用可能使用下面的，在某个package中，使用下面语句，相对于package路径
// import 'package:test/test.dart';



//常量和变量
void test1() {
  //赋予一个字符串属性
  const readonlyName = "我是只读的常量"; //编辑期间使用，  也和 swift 中 let 类似

  // final finalName = "我只能被赋值一次";//只能被赋值椅子，之后不能赋值
  final finalName; //只能被赋值椅子，之后不能赋值，宛如swift中的let
  finalName = "我只能被赋值一次";

  // static const sreadonlyName = "我是只读的类属性，只能在类中使用，相当于";
  var name = "我是可更改的变量"; //变
  name = "我的内容更新了";

  print(name);
}


//数字
void test2() {
  //数字，可以使用常见的Math函数
  var num1 = 10; //类型推断，实际是int类型
  var num2 = 10.2; //类型推断，实际是double 类型

  //数字可以使用abs()、ceil()、floor()等，也支持常见的四则运算、移位、与、或、非、异或等操作
  //也可以使用aath数学库 import 'dart:math';
  var num3 = num1 | num1 & num1 & num1;
  var numa = num2.abs();
  var numc = num2.ceil();
  var numf = num2.floor();
  var nump = pow(num2, num1); //数学库的方法

  //bool类型
  var boolNum = true;
  boolNum = false;
}


//字符串
void test3() {
  var str = '我是一个普通的字符串';
  var str1 = "我是一个没区别的双引号字符串";

  var str2 = str + str1; //拼接字符串

  //几可以使用三个单引号或者三个双引号，将一片多行字符串拼接起来
  var str3 = ''' 
    'sfasdf' 
    '123123'
  ''';
  str3 = """ 
    'sfasdf' 
    '123123'
  """;

  //字符串前面加上r内部字符串不会被转义
  var rstr = r'1212313 \n 123123';

  //字符串中拼接其他变量，通过 ${} 包裹变量内容
  var spitStr = "str的总长度是:${str.length}, str1的内容是:${str1}";

  //获取子串 1-2，从1开始共 3-1=2个字符串
  str.substring(1, 3);

  //分割字符串为数组，其他语言中也很常见
  str.split('一');

  //是否包含某一个子串
  final result = str.contains(str1);

  //查找子串的位置
  str.indexOf(str1);

  //转化为大小写
  str.toLowerCase();
  str.toUpperCase();
}


//字符串数字相互转化
void test4() {
  var num1 = 10;
  var num11 = 10.21312893192783;
  var str1 = "10.2";

  //数字转化字符串
  var num2 = int.parse(str1);
  var num3 = double.parse(str1);

  //字符串转化成数字
  var str2 = num1.toString();
  var str3 = num1.toStringAsFixed(2); //保留小数点后两位
}


//数组 List
void test5() {
  //创建一个空数组,默认为任何类型
  var list = [];
  var list1 = <int>[]; //创建只有int类型的数组

  //添加元素
  list.add(1);
  list.add("asfsdf");
  list.add("123");
  list.addAll(list1); //添加数组内所有元素

  //删除指定元素，或者指定索引的元素
  list.remove('123');
  list.removeAt(0);

  //插入的元素
  list.insert(1, "插入的元素");

  //获取数量
  list.length;

  //内部排序
  list.sort((a, b) => a > b);

  //将数组元素使用分隔符拼接成字符串
  var str = list.join(';');

  list.reversed; //置反数组

   //forin遍历数组(推荐)
  for (var item in list) {
  }
  //内部使用的也是forin
  list.forEach((element) {
  });
  var newList = list.map((e) => {
      e = e + "啦啦啦"
  });
}


//Set集合，哈希表，内部数据不会重复，无序且不重复的数据集合
void test6() {
  //创建一个 set
  var sets = {};
  //使用Set的构造方法创建
  var sets1 = Set();
  var sets2 = Set<String>();

  //创建一个有值的set
  var set = {1, 2, 3, '哈哈', '啦啦'};
  var set1 = <int>{1, 2, 3}; //创建一个指定类型的Set集合

  set.add(3);
  set.add('哈哈');

  //移除某一个元素
  set.remove(3);

  //是否包含某一个元素,此时取出已经没必要了
  set.contains(3);

  set.length; //获取数量

  //遍历集合(推荐)
  for (var item in set) {
  }
  //内部使用的也是forin
  set.forEach((element) {
  });
}


//Map集合,key-value的形式的哈希表 
void test7() {
  //  创建一个空Map，注意{}代表空Set
  var map = <String, String>{};
  //使用Map的构造方法创建
  var map1 = Map<int, String>();

  //快捷创建一个Map集合
  var map2 = {
    "key1": '哈哈',
    "key2": "啦啦"
  };

  //赋值和获取
  map["123"] = "啦啦";
  var content = map["123"];

  //获取另一个类型的数组，注意下标是key，而不是数组的顺序索引
  map1[1] = "哈哈";
  var content2 = map1[10];

  //是否包含某一个元素key
  map.containsKey("key");

  //遍历集合(推荐)
  for (var item in map.keys) {
  }
  //内部使用的也是forin
  map.forEach((key, value) {
  });
}


//基本流程语句
void test8() {
  var a = 10;
  var b = 20;
  var c = "a";
  var d = "b";

  if (c == d ) {
    //满足条件
  }else {
    //不满足条件
  }

  //for 循环遍历
  for(var i = 0; i < 10; i++) {
    print("哈哈哈");
  }

  //for in快速遍历集合
  var list = [];
  for(final item in list ) {
    print(item);
  }
  //内部是for in
  list.forEach((element) {
    print(element);
  });

  //先走控制语句
  while (a++ > b) {
    print("a不大于b");
  };

  //先走内部语句，再走控制
  do {
    print("a不大于b");
  } while(a++ > b);


  var command = 'open'; // on、open、off、close、other
  switch(command) {
    case 'on':
    case 'open': 
      print('门开着的');
      break;
    case 'off':
    case 'close': 
      print('门关着的');
      break;
    default: 
      print('门可能被打破了，不知道算开，还是关');
      break;
  }
}


//异常try catch finally
void test9(int num) {
  if (num > 10) throw FormatException("num不能大于10");
}
void test10() {
  try {
    test9(12);
  }catch(e) {
    print('出现异常了:${e.toString()}');
  }

  try {
    test9(12);
  }on FormatException {
    print("根据抛出的异常类型,只捕获某一类");
  }catch(e) {
    print("捕获剩余的类型");
  }finally {
    //无论是否异常都执行
  }
}


//定时器
void test11() {
  //只会回调一次的定时器
  Timer(Duration(seconds: 5), () {
    //执行一个5s的定时器
  });

  //会回调多次的定时器
  var num = 0;
  Timer.periodic(Duration(seconds: 5), (timer) { 
      if (num++ > 10) {
        timer.cancel(); //取消定时器
      }
      print(num);
  });
}

//给某个类型重定义名称，可以保证在不同场景更具备参考性，且可能简化代码
typedef IntMap = Map<String, int>;








