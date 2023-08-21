class ProductReviewsModel {
  ProductReviewsModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.productReviews,
  });

  ProductReviewsModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['productReviews'] != null) {
      productReviews = [];
      json['productReviews'].forEach((v) {
        productReviews!.add(ProductReviews.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<ProductReviews>? productReviews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (productReviews != null) {
      map['productReviews'] = productReviews!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Customer {
  Customer({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.phone,
    this.countryCode,
    this.addressEn,
    this.addressAr,
    this.userType,
    this.profilePhotoUrl,
    this.status,
    this.storeType,
    this.storeNameEn,
    this.storeNameAr,
    this.storeWorkStatus,
    this.aboutStoreEn,
    this.aboutStoreAr,
    this.storeDescriptionEn,
    this.storeDescriptionAr,
    this.storeServiceEn,
    this.storeServiceAr,
    this.storeStatus,
    this.storeLocation,
    this.storeCity,
    this.storeRegion,
    this.storeStreet,
    this.buildingName,
    this.buildingNumber,
    this.mailbox,
    this.postalCode,
    this.showInHomePage,
    this.freeDeliveryStatus,
    this.authenticatedStatus,
    this.storeReview,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  Customer.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['country_code'];
    addressEn = json['address_en'];
    addressAr = json['address_ar'];
    userType = json['user_type'];
    profilePhotoUrl = json['profile_photo_url'];
    status = json['status'];
    storeType = json['store_type'];
    storeNameEn = json['store_name_en'];
    storeNameAr = json['store_name_ar'];
    storeWorkStatus = json['store_work_status'];
    aboutStoreEn = json['about_store_en'];
    aboutStoreAr = json['about_store_ar'];
    storeDescriptionEn = json['store_description_en'];
    storeDescriptionAr = json['store_description_ar'];
    storeServiceEn = json['store_service_en'];
    storeServiceAr = json['store_service_ar'];
    storeStatus = json['store_status'];
    storeLocation = json['store_location'];
    storeCity = json['store_city'];
    storeRegion = json['store_region'];
    storeStreet = json['store_street'];
    buildingName = json['building_name'];
    buildingNumber = json['building_number'];
    mailbox = json['mailbox'];
    postalCode = json['postal_code'];
    showInHomePage = json['show_in_home_page'];
    freeDeliveryStatus = json['free_delivery_status'];
    authenticatedStatus = json['authenticated_status'];
    storeReview = json['store_review'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? userName;
  String? email;
  String? phone;
  String? countryCode;
  String? addressEn;
  String? addressAr;
  String? userType;
  String? profilePhotoUrl;
  String? status;
  String? storeType;
  String? storeNameEn;
  String? storeNameAr;
  String? storeWorkStatus;
  String? aboutStoreEn;
  String? aboutStoreAr;
  String? storeDescriptionEn;
  String? storeDescriptionAr;
  String? storeServiceEn;
  String? storeServiceAr;
  String? storeStatus;
  String? storeLocation;
  String? storeCity;
  String? storeRegion;
  String? storeStreet;
  String? buildingName;
  int? buildingNumber;
  int? mailbox;
  int? postalCode;
  String? showInHomePage;
  String? freeDeliveryStatus;
  String? authenticatedStatus;
  String? storeReview;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['user_name'] = userName;
    map['email'] = email;
    map['phone'] = phone;
    map['country_code'] = countryCode;
    map['address_en'] = addressEn;
    map['address_ar'] = addressAr;
    map['user_type'] = userType;
    map['profile_photo_url'] = profilePhotoUrl;
    map['status'] = status;
    map['store_type'] = storeType;
    map['store_name_en'] = storeNameEn;
    map['store_name_ar'] = storeNameAr;
    map['store_work_status'] = storeWorkStatus;
    map['about_store_en'] = aboutStoreEn;
    map['about_store_ar'] = aboutStoreAr;
    map['store_description_en'] = storeDescriptionEn;
    map['store_description_ar'] = storeDescriptionAr;
    map['store_service_en'] = storeServiceEn;
    map['store_service_ar'] = storeServiceAr;
    map['store_status'] = storeStatus;
    map['store_location'] = storeLocation;
    map['store_city'] = storeCity;
    map['store_region'] = storeRegion;
    map['store_street'] = storeStreet;
    map['building_name'] = buildingName;
    map['building_number'] = buildingNumber;
    map['mailbox'] = mailbox;
    map['postal_code'] = postalCode;
    map['show_in_home_page'] = showInHomePage;
    map['free_delivery_status'] = freeDeliveryStatus;
    map['authenticated_status'] = authenticatedStatus;
    map['store_review'] = storeReview;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class ProductReviews {
  ProductReviews({
    this.id,
    this.customerId,
    this.productId,
    this.reviewValue,
    this.reviewNote,
    this.createdAt,
    this.updatedAt,
    this.customerName,
    this.customerImage,
    this.customer,
  });

  ProductReviews.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    reviewValue = json['review_value'];
    reviewNote = json['review_note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customerName = json['customer_name'];
    customerImage = json['customer_image'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }
  int? id;
  int? customerId;
  int? productId;
  int? reviewValue;
  String? reviewNote;
  String? createdAt;
  String? updatedAt;
  String? customerName;
  String? customerImage;
  Customer? customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['product_id'] = productId;
    map['review_value'] = reviewValue;
    map['review_note'] = reviewNote;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['customer_name'] = customerName;
    map['customer_image'] = customerImage;
    if (customer != null) {
      map['customer'] = customer!.toJson();
    }
    return map;
  }
}
