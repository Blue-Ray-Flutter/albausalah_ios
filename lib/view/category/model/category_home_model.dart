class CategoryHomeModel {
  CategoryHomeModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.categories,
  });

  CategoryHomeModel.fromJson(dynamic json) {
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
    this.description,
    this.showInHomePage,
    this.image,
    this.status,
  });

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    showInHomePage = json['show_in_home_page'];
    image = json['image'];
    status = json['status'];
  }
  int? id;
  String? name;
  String? description;
  int? showInHomePage;
  String? image;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['show_in_home_page'] = showInHomePage;
    map['image'] = image;
    map['status'] = status;
    return map;
  }
}
