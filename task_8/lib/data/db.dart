import 'package:hive_flutter/hive_flutter.dart';

class UserData {
  List logData = ['user1', '123'];
  final logBox = Hive.box('logBox');
}
