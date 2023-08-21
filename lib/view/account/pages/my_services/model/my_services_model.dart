class MyServicesModel {
  MyServicesModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.services,
  });

  MyServicesModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['services'] != null) {
      services = [];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Services>? services;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (services != null) {
      map['services'] = services!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Services {
  Services({
    this.id,
    this.title,
    this.storeId,
    this.status,
  });

  Services.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    storeId = json['store_id'];
    status = json['status'];
  }
  int? id;
  String? title;
  int? storeId;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['store_id'] = storeId;
    map['status'] = status;
    return map;
  }
}
