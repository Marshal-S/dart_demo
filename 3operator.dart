//dart编程语言运算符介绍类
//这里的运算符不介绍个语言通用的运算符，只介绍比较特殊的



//关系运算符
//as、is、is!
//as为类型转换，可以转化类型，例如：将声明父类的转化声明成子类类型(实际如果不是这个类型使用可能会报错)
//有这么两个类学生Student继承人类Person

//如下，Student继承自Person，虽然强转指定类型，编译阶段不一定报错，实际运行没有该方法还是会报错
// var p = new Person();
// var a1 = p as Student; //
// a1.getName(); //如果 p实际上没有 Student的 getName方法，那么就会报错

//as
// 只是 强转了编译期的声明类型，编译期间不会报错了
//实际调用时，如果不是实际类仍然可能会报错
//使用时，一般通过多态或者通用类型声明一个对象，可以使用as转化为实际类型使用

//is 
//判断一个类是不是某一个类或者其子类，是则返回true，否则返回false
//如果一个类实现了某一个接口 T，那么 is T 也是 true




//赋值运算符
//??=  *=  /=  +=  -=  %=  &=  |=   ~=  <<=  >>=  >>>=

//这里介绍平时用的不多的

//??
//var a = b ?? c //当 b存在时返回b，否则返回c

//??=
// b ??= value  //如果b存在，b保持不变，相反，b为空，则将value的值给b

//&=(按位与赋值)   |=(安按位赋值)  !=(按位取反赋值)  <<=(按位左移赋值)   >>=(按位算术右移，最前面位置补零)   >>>=(按位逻辑右移,最前面位置补符号位)




//级联运算符 
//.. 或者 ?.. 可以省略调用，简化多次调用方法或者变量

//对于对象存在的情况，使用..
// var paint = Paint()
//   ..color = Colors.black
//   ..strokeCap = StrokeCap.round
//   ..strokeWidth = 5.0;

//相当于

// var paint = Paint();
// paint.color = Colors.black;
// paint.strokeCap = StrokeCap.round;
// paint.strokeWidth = 5.0;


//队友有些对象可能不存在的情况，使用?.. + ..
// querySelector('#confirm') // Get an object.
//   ?..text = 'Confirm' // Use its members.
//   ..classes.add('important')
//   ..onClick.listen((e) => window.alert('Confirmed!'));

//相当于

// var button = querySelector('#confirm');
// button?.text = 'Confirm';
// button?.classes.add('important');
// button?.onClick.listen((e) => window.alert('Confirmed!'));











