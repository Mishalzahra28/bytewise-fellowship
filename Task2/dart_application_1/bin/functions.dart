import 'package:iterables/iterables.dart' as iterables;
import 'dart:math';
import 'dart:io';

void main(List<String> arguments) {
  //***************************FUNCTIONS************************ */
  func('This is Mishal Zahra');
  var x = sum(8, 9);
  print(x);
  var y = sums(8);
  print(y);
  var z = sum2(8, y: 4);
  print(z);

  var x1 = rec(5);
  print(x1);

  excep();
  ageCalculator();

  print(lam2(4, 8));
  a();
  b();

  hof(9, 3, sum);
//***************************WHERE FUNCTION************* */
  var list = [1, 3, 5.5, 7, 4.5, 8, 9, 6];
  print('list=$list');
  var res = list.where((element) => element < 5).toList();
  var b1 = list.firstWhere((element) => element % 2 == 0, orElse: () => 0);
  var b2 = list.lastWhere((element) => element % 2 == 0, orElse: () => 0);
  var c1 = list.indexWhere((element) => element % 2 == 0, 5);
  var c2 = list.lastIndexWhere((element) => element % 2 == 0);
  var d = list.whereType<double>();
  // var d1 = list.removeWhere((element) => element % 2 == 0);
  var d2 = list.retainWhere((element) => element % 2 == 0);
  print('res=$res');
  print('b1=$b1');
  print('b2=$b2');
  print('c1=$c1');
  print('c2=$c2');
  print('d=$d');
  print('list=$list');

  //*******************MAP FUNCTIONS****************************/
  var a1 = [4, 2, 6, 3, 7, 1, 8, 0];
  print(a1.any((element) => element % 2 == 0)); //bool
  print(a1.every((element) => element % 2 == 0));
  print(a1.take(2));
  var sum1 = 0.0;
  List ans = a1
      .map((e) => {sum1 += e}
          //  return e;
          )
      .toList();
  print(sum1);
}

func(String message) {
  print('inside function');
  print(message);
}

int sum(x, y) {
  return x + y;
}

int sums(x, [y = 5]) {
  return x + y;
}

int sum2(x, {y = 2, a, b}) {
  return x + y;
}

//**************************RECURSSION************* */

int rec(n) {
  if (n != 0) {
    return n * rec(n - 1);
  } else {
    return 1;
  }
}

//*********************EXCEPTION******************* */
void excep() {
  try {
    for (int i = 0; i < 10; i++) {
      if (i == 5) {
        throw Exception('Error');
      }
      print('i=$i');
    }
  } catch (e) {
    print(e);
  }
}

void ageCalculator() {
  while (true) {
    try {
      print('Enter your Birth year:');
      var x = int.parse(stdin.readLineSync()!);
      var age = DateTime.now().year - x;
      print(age);
      if (age < 0) throw FormatException();
      if (age < 6) throw Exception();
      print('Your age is $age');
      break;
    } on FormatException {
      print('Invalid data......try again');
    } catch (e) {
      print('Age under 6 years old');
    }
  }
}

//**********************************LAMBDA FUNCTION******************************* */
//one line functions

var a = () => print('Inside a');
void Function() b = () => print('Inside b');
int lam2(a, b) => a + b;

//************************Higher Order Function********************** */
// need another function to work
void a1(x, y) {
  print('Sum of values is ${x + y}');
}

void hof(int a, int b, Function sum) {
  sum(a, b);
}




// }