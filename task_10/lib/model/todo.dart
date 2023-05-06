import 'package:uuid/uuid.dart';

var _uuid = Uuid();

class Todo {
  final String? description;
  // late final String id;

  Todo({
    this.description,
    // String id,
  });
  // : id = id ?? _uuid.v4();
}
