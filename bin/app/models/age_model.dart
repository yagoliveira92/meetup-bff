class AgeModel {
  int? age;
  int? count;
  String? name;

  AgeModel({this.age, this.count, this.name});

  AgeModel.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    count = json['count'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['count'] = count;
    data['name'] = name;
    return data;
  }
}
