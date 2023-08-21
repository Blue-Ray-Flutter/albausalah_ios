class HistoryProductModel {
  HistoryProductModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.products,
  });

  HistoryProductModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (products != null) {
      map['products'] = products!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Products {
  Products({
    this.id,
    this.userId,
    this.storeId,
    this.productName,
    this.createdAt,
    this.updatedAt,
  });

  Products.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    storeId = json['store_id'];
    productName = json['product_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  int? storeId;
  String? productName;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['store_id'] = storeId;
    map['product_name'] = productName;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
