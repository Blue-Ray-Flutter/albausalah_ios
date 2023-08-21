class StoreReviewsModel {
  StoreReviewsModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.storeReviews,
  });

  StoreReviewsModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['storeReviews'] != null) {
      storeReviews = [];
      json['storeReviews'].forEach((v) {
        storeReviews!.add(StoreReviews.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<StoreReviews>? storeReviews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (storeReviews != null) {
      map['storeReviews'] = storeReviews!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class StoreReviews {
  StoreReviews({
    this.id,
    this.customerId,
    this.storeId,
    this.reviewValue,
    this.reviewNote,
    this.createdAt,
    this.updatedAt,
    this.customerName,
    this.customerImage,
  });

  StoreReviews.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    storeId = json['store_id'];
    reviewValue = json['review_value'];
    reviewNote = json['review_note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customerName = json['customer_name'];
    customerImage = json['customer_image'];
  }
  int? id;
  int? customerId;
  int? storeId;
  int? reviewValue;
  String? reviewNote;
  String? createdAt;
  String? updatedAt;
  String? customerName;
  String? customerImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['store_id'] = storeId;
    map['review_value'] = reviewValue;
    map['review_note'] = reviewNote;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['customer_name'] = customerName;
    map['customer_image'] = customerImage;
    return map;
  }
}
