class CategoryModel {
  CategoryModel({
    this.status,
    this.msg,
    this.success,
    this.requestDate,
    this.category,
  });

  CategoryModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    success = json['success'];
    requestDate = json['request_date'];
    if (json['categories'] != null) {
      category = [];
      json['categories'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Category>? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    map['request_date'] = requestDate;
    map['success'] = success;
    if (category != null) {
      map['categories'] = category!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Category {
  Category({
    this.description,
    this.id,
    this.image,
    this.name,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? description;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['image'] = image;
    return map;
  }
}
