class DeliveryOrderModel {
  DeliveryOrderModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.finishOrders,
    this.pendingOrders,
  });

  DeliveryOrderModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['finishOrders'] != null) {
      finishOrders = [];
      json['finishOrders'].forEach((v) {
        finishOrders!.add(FinishOrders.fromJson(v));
      });
    }
    if (json['pendingOrders'] != null) {
      pendingOrders = [];
      json['pendingOrders'].forEach((v) {
        pendingOrders!.add(PendingOrders.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<FinishOrders>? finishOrders;
  List<PendingOrders>? pendingOrders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (finishOrders != null) {
      map['finishOrders'] = finishOrders!.map((v) => v.toJson()).toList();
    }
    if (pendingOrders != null) {
      map['pendingOrders'] = pendingOrders!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class FinishOrders {
  FinishOrders({
    this.id,
    this.userId,
    this.storeId,
    this.subTotal,
    this.endTotal,
    this.endTax,
    this.productCount,
    this.status,
    this.deliveryUserId,
    this.deliveryStatus,
    this.createdAt,
    this.updatedAt,
  });

  FinishOrders.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    storeId = json['store_id'];
    subTotal = json['sub_total'];
    endTotal = json['end_total'];
    endTax = json['end_tax'];
    productCount = json['product_count'];
    status = json['status'];
    deliveryUserId = json['delivery_user_id'];
    deliveryStatus = json['delivery_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  int? storeId;
  String? subTotal;
  String? endTotal;
  String? endTax;
  int? productCount;
  String? status;
  int? deliveryUserId;
  String? deliveryStatus;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['store_id'] = storeId;
    map['sub_total'] = subTotal;
    map['end_total'] = endTotal;
    map['end_tax'] = endTax;
    map['product_count'] = productCount;
    map['status'] = status;
    map['delivery_user_id'] = deliveryUserId;
    map['delivery_status'] = deliveryStatus;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class PendingOrders {
  PendingOrders({
    this.id,
    this.userId,
    this.storeId,
    this.subTotal,
    this.endTotal,
    this.endTax,
    this.productCount,
    this.status,
    this.deliveryUserId,
    this.deliveryStatus,
    this.createdAt,
    this.updatedAt,
  });

  PendingOrders.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    storeId = json['store_id'];
    subTotal = json['sub_total'];
    endTotal = json['end_total'];
    endTax = json['end_tax'];
    productCount = json['product_count'];
    status = json['status'];
    deliveryUserId = json['delivery_user_id'];
    deliveryStatus = json['delivery_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  int? storeId;
  String? subTotal;
  String? endTotal;
  String? endTax;
  int? productCount;
  String? status;
  int? deliveryUserId;
  String? deliveryStatus;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['store_id'] = storeId;
    map['sub_total'] = subTotal;
    map['end_total'] = endTotal;
    map['end_tax'] = endTax;
    map['product_count'] = productCount;
    map['status'] = status;
    map['delivery_user_id'] = deliveryUserId;
    map['delivery_status'] = deliveryStatus;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
