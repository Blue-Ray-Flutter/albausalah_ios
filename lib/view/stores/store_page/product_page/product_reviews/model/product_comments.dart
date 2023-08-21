class ProductCommentsModel {
  ProductCommentsModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.productComments,
  });

  ProductCommentsModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['productComments'] != null) {
      productComments = [];
      json['productComments'].forEach((v) {
        productComments!.add(ProductComments.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<ProductComments>? productComments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (productComments != null) {
      map['productComments'] = productComments!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductComments {
  ProductComments({
    this.id,
    this.customerId,
    this.productId,
    this.comment,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
    this.name,
    this.children,
  });

  ProductComments.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    comment = json['comment'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
    name = json['name'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
  }
  int? id;
  int? customerId;
  int? productId;
  String? comment;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? profilePhotoUrl;
  List<Children>? children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['product_id'] = productId;
    map['comment'] = comment;
    map['parent_id'] = parentId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['name'] = name;
    map['profile_photo_url'] = profilePhotoUrl;
    if (children != null) {
      map['children'] = children!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Children {
  Children({
    this.id,
    this.customerId,
    this.productId,
    this.comment,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.children,
    this.profilePhotoUrl,
    this.name,
  });

  Children.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    comment = json['comment'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    profilePhotoUrl = json['profile_photo_url'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
  }
  int? id;
  int? customerId;
  int? productId;
  String? comment;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? profilePhotoUrl;
  List<Children>? children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['product_id'] = productId;
    map['comment'] = comment;
    map['parent_id'] = parentId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['name'] = name;
    map['profile_photo_url'] = profilePhotoUrl;
    if (children != null) {
      map['children'] = children!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
