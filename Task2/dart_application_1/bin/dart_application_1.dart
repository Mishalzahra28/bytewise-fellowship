import 'dart:math';
import 'dart:io';

void main(List<String> arguments) {
  //***********BASICS************** */
  var x1 = 10;
  int a = 5;
  int val1 = 4;
  int val2 = 7;
  double b = 6.8;
  String c = 'Mishal Zahra';
  bool d = false;

  String str = "45";
  var j = num.parse(str);

  var z = a.toDouble();
  // x.toString();
  // a='New type';
  print(j.runtimeType);
  print('integer=$a');
  print('double=$b');
  print('String=$c');
  print('Type of c is:${c.runtimeType}');
  print('bool=$d');
  print('Type cast=$z');
  print('x=$x1');
  print('x+1=${x1 + 1}');
  print('Hello world');
  if (x1 > 8) {
    print('Greater than 8');
  } else if (x1 == 8) {
    print('Equal to 8');
  } else {
    print('less than 8');
  }
  x1 > a ? print('X is greater than A') : print('X is less than A');
  int value = val1 > val2 ? val1 : val2;
  print('VALUE= ${value}');
  var ans;
  var name = ans ?? 'NEW STRING';
  print('String value=${name}');
  print('''

THIS IS MULTI-LINED

''');

//*********************************SWITCH******************* */
  var x2 = 10;
  var y1 = 8;
  var op = 'k';
  switch (op) {
    case '+':
      {
        print('x+y=${x2 + y1}');
        break;
      }
    case '-':
      {
        print('x-y=${x2 - y1}');
        break;
      }
    case '/':
      {
        print('x/y=${x2 / y1}');
        break;
      }
    case '*':
      {
        print('x*y=${x2 * y1}');
        break;
      }
    default:
      print('invalid input');
  }

  //*********************************LOOPS******************* */
  //***************WHILE********* */
  int i = 10;
  while (i > 0) {
    print('Hello ${i}');
    i--;
  }
  //**********DO-WHILE******** */
  int i1 = 10;
  do {
    print('Do-while ${i1}');
    i1++;
  } while (i1 <= 20);
  //**********DO-WHILE******** */
  for (int i = 0; i < 10; i++) {
    print('for loop ${i}');
    print(Random().nextInt(100));
  }

  //*****************************NUMBER METHODS********** */
  var x = -4;
  print('x.isOdd=${x.isOdd}');
  print('x.isEven=${x.isEven}');
  print('x.isFinite=${x.isFinite}');
  print('x.isInfinite=${x.isInfinite}');
  print('x.isNaN=${x.isNaN}');
  print('x.isNegative=${x.isNegative}');
  print('x.abs()=${x.abs()}');
  var y = -8.5;
  print('y.round()=${y.round()}');
  print('y.floor()=${y.floor()}');
  print('y.truncate()=${y.truncate()}');
  print('x.ceil()=${y.ceil()}');
  print('y.remainder()=${y.remainder(x)}');

  //******************************STRING METHOD*********** */
  var name1 = 'Mishal';
  print('name1.isEmpty=${name1.isEmpty}');
  print('name1.isNotEmpty=${name1.isNotEmpty}');
  print('name1.toLowerCase()=${name1.toLowerCase()}');
  print('name1.toUpperCase()=${name1.toUpperCase()}');
  print('name1.contain("sha")=${name1.contains("sha")}');
  print('name1.replaceRange()=${name1.replaceRange(0, 4, "Nih")}');
  print('name1.replaceAll()=${name1.replaceAll("i", "k")}');
  print('name1.replaceFirst()=${name1.replaceFirst("l", "j")}');

  var text = '     H#a#s#s#a#n';
  var v1 = text.split('#');
  print(v1);
  var v2 = v1.join('#');
  print(v2);
  print(v2.replaceAll('#', '').trim());
  print(text.trim());

  //*********************TAKING INPUT**************************** */
  while (true) {
    try {
      print('Enter your birth year:');
      var byear = num.parse(stdin.readLineSync()!);
      var age = DateTime.now().year - byear;
      print('User age is $age');
      break;
    } on FormatException {
      print('Invalid Format');
    } catch (e) {
      print('Error Message $e');
    }
  }

  //*******************ITERABLE********************************* */
  List<int> li = [1, 2, 3, 4];
  List<String> li2 = ['I', 'am', 'Mishal'];
  List<double> li3 = [1.5, 2.8, 3, 4];
  List<dynamic> li4 = [1, 2.4, 'A', true];
  print(li4[1]);
  for (var item in li2) {
    print(item);
  }
  Set<int> s1 = {1, 3, 6};
  Map<int, String> m1 = {1: 'a', 2: 'b'};
  Map<String, double> marks = {'amna': 70, 'Alina': 65};
  print(marks['amna']);

  //***********************LIST**************************** */
  var list = [1, 3, 6, 2, 9, 6, 5];
  print(list);
  print(list[3]);
  print(list.first);
  print(list.last);
  print(list.reversed);
  list[1] = 99;
  print(list);
  list.add(20);
  print('After addition $list');
  list.addAll([30, 33, 44]);
  print('After addAll $list');
  list.insert(0, 8);
  print('After insertion $list');
  list.insertAll(2, [4, 6, 7]);
  print('After insertAll $list');
  list.remove(6);
  print('After removing $list');
  list.removeAt(8);
  print('After removeAt $list');
  list.removeLast();
  print('After removeLast $list');
  list.removeRange(3, 7);
  print('After removeRange $list');
  list.replaceRange(0, 3, [1, 1]);
  print('After replaceRange $list');
  //**********2D List*****************/
  var list2 = [
    [3, 4, 5],
    [8, 33, 6],
    [6, 4, 7],
    [9, 6, 10]
  ];
  for (int i = 0; i < list2.length; i++) {
    print(list2[i][2]);
  }
  for (var item in list2) {
    for (var i in item) {
      print(i);
    }
  }
  //*****************************SET****************************** */
  // var x = {4, 5, 6, 7, 8, 9, 2, 1, 0};
  // x.forEach((element) {
  //   print(element);
  // });
  // List z = x.toList();
  // print(z);

  // x.add(10);
  // print('after add $x');
  // x.addAll([33, 55, 67]);
  // print('after addAll $x');
  // print('x.length= ${x.length}');
  // print('x.elementAt(0)= ${x.elementAt(0)}');
  // print('x.contains(5)= ${x.contains(5)}');
  // x.remove(5);
  // print('x.remove= $x');
  // x.clear();
  // print('x.clear= $x');

  // var a = {1, 2, 3, 6};
  // var b = {5, 6, 2, 8};
  // print('Intersection ${a.intersection(b)}');
  // print('Union ${a.union(b)}');
  // print('Difference ${a.difference(b)}');
  // print('Difference ${x.difference(a)}');

  //********************************MAPS*************************** */
  // var x = {9: 'a', 8: 'b', 7: 'c'};
  // Map y = {9: 'a', 8: 'b', 7: 'c'};
  // x.forEach((key, value) {
  //   print('key:$key, value:$value');
  // });

  // print(y);
  // print(x[9]);
  // print(x.keys);
  // print(x.values);
  // print(x.entries);
  // x.addAll(({6: 'b', 5: 'c'}));
  // print('After addAll $x');
  // print('x.containskey ${x.containsKey("a")}');
  // print('x.containsValue ${x.containsValue("a")}');
  // x.remove(9);
  // print('after removing $x');
  // x.clear;
  //***************************FUNCTIONS************************ */
  // func('This is Mishal Zahra');
  // var x = sum(8, 9);
  // print(x);
  // var y = sums(8);
  // print(y);
  // var z = sum2(8, y: 4);
  // print(z);

  // var x = rec(5);
  // print(x);

  // excep();
  // ageCalculator();

  // lam1();
  // print(lam2(4, 8));
  // a();
  // b();
  // hof(9, 3, a1);

//***************************WHERE FUNCTION************* */
  // var list = [1, 3, 5.5, 7, 4.5, 8, 9, 6];
  // print('list=$list');
  // var res = list.where((element) => element < 5).toList();
  // var b1 = list.firstWhere((element) => element % 2 == 0, orElse: () => 0);
  // var b2 = list.lastWhere((element) => element % 2 == 0, orElse: () => 0);
  // var c1 = list.indexWhere((element) => element % 2 == 0, 5);
  // var c2 = list.lastIndexWhere((element) => element % 2 == 0);
  // var d = list.whereType<double>();
  // // var d1 = list.removeWhere((element) => element % 2 == 0);
  // var d2 = list.retainWhere((element) => element % 2 == 0);
  // print('res=$res');
  // print('b1=$b1');
  // print('b2=$b2');
  // print('c1=$c1');
  // print('c2=$c2');
  // print('d=$d');
  // print('list=$list');

  //*******************MAP FUNCTIONS****************************/
  // var a1 = [4, 2, 6, 3, 7, 1, 8, 0];
  // print(a1.any((element) => element % 2 == 0)); //bool
  // print(a1.every((element) => element % 2 == 0));
  // print(a1.take(2));
  // var sum=0.0;
  // List ans= a1.map((e) => {
  //      sum += e;
  //      return e;
  //      }).toList();
  //  print(sum);
}

// func(String message) {
//   print('inside function');
//   print(message);
// }

// int sum(x, y) {
//   return x + y;
// }

// int sums(x, [y = 5]) {
//   return x + y;
// }

// int sum2(x, {y = 2, a, b}) {
//   return x + y;
// }

//**************************RECURSSION************* */

// int rec(n) {
//   if (n != 0) {
//     return n * rec(n - 1);
//   } else {
//     return 1;
//   }
// }
//*********************EXCEPTION******************* */
// void excep() {
//   try {
//     for (int i = 0; i < 10; i++) {
//       if (i == 5) {
//         throw Exception('Error');
//       }
//       print('i=$i');
//     }
//   } catch (e) {
//     print(e);
//   }
// }

// void ageCalculator() {
//   while (true) {
//     try {
//       print('Enter your Birth year:');
//       var x = int.parse(stdin.readLineSync()!);
//       var age = DateTime.now().year - x;
//       print(age);
//       if (age < 0) throw FormatException();
//       if (age < 6) throw Exception();
//       print('Your age is $age');
//       break;
//     } on FormatException {
//       print('Invalid data......try again');
//     } catch (e) {
//       print('Age under 6 years old');
//     }
//   }
// }

//**********************************LAMBDA FUNCTION******************************* */
//one line functions

// var a = () => print('Inside a');
// void Function() b = () => print('Inside b');
// int lam2(a, b) => a + b;

//************************Higher Order Function********************** */
//need another function to work
// void a1(x, y) {
//   print('Sum of values is ${x + y}');
// }

// void hof(int a, int b, Function sum) {
//   sum(a, b);
// }
