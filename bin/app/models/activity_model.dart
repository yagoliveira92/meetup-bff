class ActivityModel {
  String? activity;
  String? type;
  int? participants;
  double? price;
  String? link;
  String? key;
  double? accessibility;

  ActivityModel(
      {activity, type, participants, price, link, key, accessibility});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    type = json['type'];
    participants = json['participants'];
    price = json['price'].toDouble();
    link = json['link'];
    key = json['key'];
    accessibility = json['accessibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity'] = activity;
    data['type'] = type;
    data['participants'] = participants;
    data['price'] = price;
    data['link'] = link;
    data['key'] = key;
    data['accessibility'] = accessibility;
    return data;
  }
}
