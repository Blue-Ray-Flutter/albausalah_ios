class StoreCategoriesModel {
  StoreCategoriesModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.categories,
  });

  StoreCategoriesModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Categories>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (categories != null) {
      map['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Categories {
  Categories({
    this.id,
    this.name,
  });

  Categories.fromJson(dynamic json) {
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
