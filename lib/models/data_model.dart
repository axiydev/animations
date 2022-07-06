class DataDb {
  String? name;
  int? age;
  DataDb.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];
}
