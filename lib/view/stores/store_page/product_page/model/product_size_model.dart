class ProductSizeModel {
  ProductSizeModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.sizes,
  });

  ProductSizeModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['sizes'] != null) {
      sizes = [];
      json['sizes'].forEach((v) {
        sizes!.add(Sizes.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Sizes>? sizes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (sizes != null) {
      map['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Sizes {
  Sizes({
    this.id,
    this.name,
  });

  Sizes.fromJson(dynamic json) {
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
