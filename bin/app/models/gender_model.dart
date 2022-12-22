class GenderModel {
  int? count;
  String? gender;
  String? name;
  double? probability;

  GenderModel({this.count, this.gender, this.name, this.probability});

  GenderModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    gender = json['gender'];
    name = json['name'];
    probability = json['probability'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['gender'] = gender;
    data['name'] = name;
    data['probability'] = probability;
    return data;
  }
}
