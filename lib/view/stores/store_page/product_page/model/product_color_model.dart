class ProductColorModel {
  ProductColorModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.colors,
  });

  ProductColorModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['colors'] != null) {
      colors = [];
      json['colors'].forEach((v) {
        colors!.add(ProductColors.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<ProductColors>? colors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (colors != null) {
      map['colors'] = colors!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductColors {
  ProductColors({
    this.id,
    this.name,
  });

  ProductColors.fromJson(dynamic json) {
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
