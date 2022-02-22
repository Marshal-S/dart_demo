//dart编程语言类介绍 类、枚举、接口

var pointMap = Map<String, List<double>>();

class Point {
  double x = 0;
  double y = 0;
  // double? x, y; //可以连续声明多个，也可以赋值
  // double x = 0, y = 0;
  final double z; //属性只能被赋值一次


  //一般构造方法这么写
  // Point(double? x, doubel, y) {
  //   this.x = x;
  //   this.y = y;
  // }

  //系统给了语法糖就可以这么简化了, 注意，构造方法不可以被重写，只能写自己的
  // Point(this.x, this.y, this.z); //构造方法

  //赋值的时候，以这种方式可以给剩下的赋值
  // Point(this.x, this.y): z = 20;

  //命名式构造方法
  //方式： [类名].[方法名]
  //如果构造方法初始化全部，需要在后面加上 : 且赋值，如下所示
  // Point.origin(): x = 0, y = 0, z = 0;
  //相当于下面的
  Point.origin(this.x, this.y, this.z);

  //factory 工厂模式
  //先使用命名式构造方法，定义一个构造函数，用来赋值
  Point.internal(this.x, this.y): z = 0;
  //在使用默认的属性，来给默认的构造方法开启构造工厂
  factory Point(String key) {
    var pointList = pointMap[key];
    if (pointList == null) {
      return new Point.internal(0, 0);
    }
    return Point.internal(pointList[0], pointList[1]);
  }


  //声明一个函数，这里不多介绍
  printPoint() {
    print("point");
  }

  //可以理解为类方法，需要通过类名调用，但是也不像其他语言一样，其不能与对象方法同名
  static sPrintPoint() {
    //注意static方法不想像其他语言一样使用this调用同类型方法
    print("point");
    Point.sPrintPoint2(); //不能使用this.sPrintPoint2()
  }
  static sPrintPoint2() {}


  //重写运算符，可以传入操作符右侧变量
  Point operator +(Point value) => Point.origin(x + value.x, y + value.y, z + value.z);
  Point operator -(Point value) => Point.origin(x - value.x, y - value.y, z - value.z);
}


//Setter 和 Getter（与其他语言的 set 和 get不太一样）
//注意：其只能以 set 和 get 修饰方法名，其能像方法属性一样赋值和获取，但不是重写已经声明的属性字段，也不能同名
//个人感觉实际使用意义不是很大，就是能像属性一样调用罢了
var instance = Rectangle(1, 2, 3, 4);
class Rectangle {
  double left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  //可以通过static静态方法，搞一个单例
  static Rectangle get shared => instance;

  //普通使用set 和 get，重写后调用方便 看情况使用
  //下面设置一个居右侧属性
  double get right => width + left;
  set right(double value) => left = value - width;
}



//抽象方法 abstract,
//抽象方法就是接口，通常作为接口实现成多个相似的类
//其无法创建实例,且内部定义的方法一定是抽象方法
abstract class AbstractClass {
  // Define constructors, fields, methods...
  speak(); // Abstract method. 
}
abstract class AbstractClass1 {
  // Define constructors, fields, methods...
  talk(); // Abstract method.
}
//实现接口
//通过实现接口，可以给让不同的类实现统一调度功能，就像多态一样
class Children implements AbstractClass {
  @override
  speak() {
    print("嘤嘤嘤");
  }
}
class Person implements AbstractClass {
  @override
  speak() {
    print("我不止嘤嘤嘤，我还哈哈哈");
  }
}

//通过将变量类型声明成接口，可以被遵循接口的类统一调度
speakForAll(AbstractClass p) {
  p.speak();
}
testSpeak() {
  var chi = Children();
  var per = Person();
  speakForAll(chi);
  speakForAll(per);
}


//继承 extends
//class 内部也可以定义接口，只不过是通过继承重写的方式来实现
//因此通过继承定义的接口也被称为隐式接口
class ParentClass {
  ParentClass();

  void sayHello() {
    print("hello");
  }
}
//继承，采用 extends
class SubClass extends ParentClass {
  SubClass();

  @override
  void sayHello() {
    // super.sayHello(); //可以通过super调用父类方法
    print("我不会sayHello");
  }
}


//继承并实现抽象接口，可以同时实现多个抽象接口
class B extends A implements AbstractClass, AbstractClass1 {
  @override
  speak() {
    print("我不止嘤嘤嘤，我还哈哈哈");
  }

  @override
  talk() {
    print('我已经不只是会嘤嘤嘤，还会正常聊天了');
  }
}


//类扩展 extension
//能在原有类的基础上扩展出新的属性或者方法
// extension + 扩展名 + on + 被扩展类名
//扩展的父类，子类仍然能用，反之不能
extension Employee on SubClass {
  void work() {
    print("我能工作了");
  }
}
extension Sleep on ParentClass {
  void sleep() {
    print("我休息了");
  }
}



//消息转发 noSuchMethod
//可以通过重写该方法，来处理调用错误方法问题，
class A {
  @override
  void noSuchMethod(Invocation invocation) {
    print('你调用的方法不存在，方法名为: '
        '${invocation.memberName}');
  }
}



//maxin
//使用方式，class ... + with + maxin类
//多继承中的基本类，使用maxin修饰的类，可以让继承者们同时继承不止一个父类
//与其他语言不同的是(C++除外)，通过多继承，可以直接使用被继承的类已实现现有的功能
//使用时需，注意类功能的重复，以及类多继承中交叉继承的问题
//注意：其他的语言通过接口、协议、扩展等来代替他，其中扩展与其类似，而扩展却是针对固定类的

//定义一个打游戏的类
mixin Player {
  bool canPlayWangzhe = false;
  bool canPlaychiji = false;

  playGames() {
    print('在这里,我是一名游戏玩家');
  }
}
//定义一个类，只能被继承B的类，多继承
mixin stu on B {
  study() {
    print('我是学生,要学习');
  }
}
//继承 A 的同时，继承了 Player，通过with可以继承多个
//继承了A，此时不能继承Stu
class maxinTestClass extends A with Player {
}
//继承多个，继承B的同时继承Stu，player
class maxinTest2222Class extends B with Player, stu {
}



//泛型 T
//泛型可以通过一个类型name(一般用T，也可以根据指定场景起名),可以泛指某一个设定的类型
//最常见的泛型使用案例，集合
//例如：
var list = <int>[];//这个<int>，括号里面的就是泛型，也可以点进去查看

//下面定义一个栈，定义泛型(命名为T)，用来代替里面存放节点的类型
class Stack<T> {
  List<T> container = [];
  //传入 T 类型的参数
  push(T element) {
    container.add(element);
  }
}
testStack() {
  var stack = Stack<String>();
  stack.push("哈哈");
  var stack2 = Stack<int>();
  stack2.push(2);
}
//如果想 像多继承一样限制泛型可以使用的类型怎么办
//如下所示，使用 extends 来限制类型为 int 或者为其子类
class StrStack<T extends String> {
  List<T> container = [];
  //传入 T 类型的参数
  push(T element) {
    container.add(element);
  }
}
testStack2() {
  var stack = StrStack<String>();
  stack.push("哈哈");
  // var stack2 = StrStack<int>();这个就报错了
}

//可能会封装一个，支持多个类型的处理方法
//单纯的使用一个泛型方法,其类型约束也是extends
class handlerClass {
  static pushByList<T>(List<T> list, T object) {
    list.add(object);
    //debug可以打印了运行时的实际类型字符串
    // print(object.runtimeType.toString());
  }
  static pushByList2<T extends String>(List<T> list, T str) {
    list.add(str);
  }
}



//枚举
//调用，可以使用前面介绍的swift来实现不同情况，当然if else也可以
enum Level {
  firstLevel,
  secondLevel,
  thirdLevel,
  maxLevel
}



void main() {
  // var point0 = Point(0, 0, 0); //正常使用构造方法
  // var point1 = Point.internal(10, 10); //命名式构造方法
  // var point = Point("1010"); //调用工厂构造方法初始化
  // point.printPoint(); //调用对象方法
  // Point.sPrintPoint();//调用对象方法

  var instance = Rectangle.shared;
  instance.right = 10;

  //测试接口功能
  testSpeak();

  //测试继承与扩展
  var pt = ParentClass();
  pt.sayHello();
  pt.sleep();
  // pt.work(); //由于不是给父类扩展所以不能用

  var subcls = SubClass();
  subcls.sayHello();
  subcls.work(); //扩展的方法，继承的方法
  subcls.sleep();

  //枚举的使用
  print(Level.firstLevel);


}
