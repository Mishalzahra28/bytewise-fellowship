import 'package:dart_application_1/dart_application_1.dart'
    as dart_application_1;

// void main(List<String> arguments) {
// Human h1 = Human('Amna', 22, 5.4);
// Human h2 = Human('Ali', 27, 5.8);
// Human.func();
// h1.setWeight(45);
// var x = h1.getWeight();
// print(x);

// var obj1 = A(); //has type A
// obj1.info();
// var obj2 = B(); //has type B,A
// obj2.func();
// var obj3 = C('Hello'); //has type A,B,C
//   var obj = D();
//   obj.info1();
//   obj.info2();
//   obj.info3();
// }

// class Human {
//   var name, age, height;
//   static var marks = 50;
//   late num weight;
//   Human(String name, int age, double height) {
//     this.name = name;
//     this.age = age;
//     this.height = height;
//     print('Name=$name');
//     print('Age=$age');
//     print('Height=$height');
//     print('-------------');
//   }
//   static void func() {
//     marks = marks + 20;
//     print(marks);
//   }

//   void setWeight(num weight) {
//     this.weight = weight;
//   }

//   dynamic getWeight() {
//     return weight;
//   }
// }

//*******************************SUPER*******************/
// class A {
//   A(msg) {
//     print('message1=$msg');
//   }
// }

// class B extends A {
//   B(msg) : super('Hello') {
//     print('message2=$msg');
//   }
// }

// class C extends B {
//   C(String str) : super(str) {
//     print('Message3=$str');
//   }
// }

//********************OVERRIDE & ABSTRACT/INTERFACE**********************/

// abstract class A {
//   void info();
// }

// class B extends A {
//   @override
//   void info() {
//     print('message-2');
//   }
// }

// class C extends B {}
//*****************************MIXIN***********************************/
// mixin A {
//   void info1();
// }

// mixin B {
//   void info2();
// }

// mixin C {
//   void info3();
// }

// class D implements A, B, C {
//   @override
//   void info1() {
//     print('message-1');
//   }

//   @override
//   void info2() {
//     print('message-2');
//   }

//   @override
//   void info3() {
//     print('message-3');
//   }
// }

//*****************************ENUM*************************/
// void main() {
//   print(Colors.blue);
//   print(Colors.values[0]);
//   print(Colors.values.length);
//   print(info(Colors.green));
// }

// enum Colors { red, blue, green }

// String info(Colors s) {
//   switch (s) {
//     case Colors.red:
//       return 'red';

//     case Colors.blue:
//       return 'blue';

//     case Colors.green:
//       return 'Green';
//   }
// }

//*****************************GENERIC************** */
void main() {
  var a = A<int, String>();
  a.x = 6;
  a.y = 'Hello';
  var b = A<double, bool>();
  b.x = 7.5;
  b.y = true;
  print(a.x);
  print(a.y);
  print(b.x);
  print(b.y);
}

class A<T, E> {
  late T x;
  late E y;
}
