import 'country_model.dart';

class NationModel {
  List<Country>? country;
  String? name;

  NationModel({this.country, this.name});

  NationModel.fromJson(Map<String, dynamic> json) {
    if (json['country'] != null) {
      country = <Country>[];
      json['country'].forEach((v) {
        country!.add(new Country.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (country != null) {
      data['country'] = country!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    return data;
  }
}
