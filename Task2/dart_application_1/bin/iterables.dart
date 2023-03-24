import 'package:iterables/iterables.dart' as iterables;

void main(List<String> arguments) {
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
  var x = {4, 5, 6, 7, 8, 9, 2, 1, 0};
  x.forEach((element) {
    print(element);
  });
  List z = x.toList();
  print(z);

  x.add(10);
  print('after add $x');
  x.addAll([33, 55, 67]);
  print('after addAll $x');
  print('x.length= ${x.length}');
  print('x.elementAt(0)= ${x.elementAt(0)}');
  print('x.contains(5)= ${x.contains(5)}');
  x.remove(5);
  print('x.remove= $x');
  x.clear();
  print('x.clear= $x');

  var a = {1, 2, 3, 6};
  var b = {5, 6, 2, 8};
  print('Intersection ${a.intersection(b)}');
  print('Union ${a.union(b)}');
  print('Difference ${a.difference(b)}');
  print('Difference ${x.difference(a)}');

  //********************************MAPS*************************** */
  var x1 = {9: 'a', 8: 'b', 7: 'c'};
  Map y = {9: 'a', 8: 'b', 7: 'c'};
  x1.forEach((key, value) {
    print('key:$key, value:$value');
  });

  print(y);
  print(x1[9]);
  print(x1.keys);
  print(x1.values);
  print(x1.entries);
  x1.addAll(({6: 'b', 5: 'c'}));
  print('After addAll $x1');
  print('x1.containskey ${x1.containsKey("a")}');
  print('x1.containsValue ${x1.containsValue("a")}');
  x1.remove(9);
  print('after removing $x1');
  x1.clear;
}
