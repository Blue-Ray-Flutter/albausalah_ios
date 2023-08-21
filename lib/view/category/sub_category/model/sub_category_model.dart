class SubCategoryModel {
  SubCategoryModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.subCategories,
  });

  SubCategoryModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['sub_categories'] != null) {
      subCategories = [];
      json['sub_categories'].forEach((v) {
        subCategories!.add(SubCategories.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<SubCategories>? subCategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (subCategories != null) {
      map['sub_categories'] = subCategories!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SubCategories {
  SubCategories({
    this.id,
    this.name,
    this.description,
    this.image,
    this.status,
  });

  SubCategories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
  }
  int? id;
  String? name;
  String? description;
  String? image;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['image'] = image;
    map['status'] = status;
    return map;
  }
}
