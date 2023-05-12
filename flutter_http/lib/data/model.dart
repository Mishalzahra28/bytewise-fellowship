class Model {
  final String? title;
  final bool? status;

  Model({this.title, this.status});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      title: json['title'],
      status: json['status'],
    );
  }
}
