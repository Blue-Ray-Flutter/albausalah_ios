class CitiesModel {
  CitiesModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.cities,
  });

  CitiesModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['cities'] != null) {
      cities = [];
      json['cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Cities>? cities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (cities != null) {
      map['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Cities {
  Cities({
    this.id,
    this.name,
  });

  Cities.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
