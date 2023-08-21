class ProductsModel {
  ProductsModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.data,
  });

  ProductsModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.showProducts,
    this.storeInfo,
  });

  Data.fromJson(dynamic json) {
    if (json['showProducts'] != null) {
      showProducts = [];
      json['showProducts'].forEach((v) {
        showProducts!.add(ShowProducts.fromJson(v));
      });
    }
    storeInfo = json['store_info'] != null
        ? StoreInfo.fromJson(json['store_info'])
        : null;
  }
  List<ShowProducts>? showProducts;
  StoreInfo? storeInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (showProducts != null) {
      map['showProducts'] = showProducts!.map((v) => v.toJson()).toList();
    }
    if (storeInfo != null) {
      map['store_info'] = storeInfo!.toJson();
    }
    return map;
  }
}

class ShowProducts {
  ShowProducts({
    this.id,
    this.name,
    this.categoryId,
    this.subCategoryId,
    this.sku,
    this.image,
    this.description,
    this.salePrice,
    this.onSalePriceStatus,
    this.productReview,
    this.summerOffer,
    this.storeId,
    this.orderCount,
    this.status,
    this.deletedAt,
    this.wishlistProduct,
  });

  ShowProducts.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    sku = json['sku'];
    image = json['image'];
    description = json['description'];
    salePrice = json['sale_price'];
    onSalePriceStatus = json['on_sale_price_status'];
    productReview = json['product_review'];
    summerOffer = json['summer_offer'];
    storeId = json['store_id'];
    orderCount = json['order_count'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    wishlistProduct = json['wishlistProduct'];
  }
  int? id;
  String? name;
  int? categoryId;
  int? subCategoryId;
  String? sku;
  String? image;
  String? description;
  String? salePrice;
  String? onSalePriceStatus;
  String? productReview;
  String? summerOffer;
  int? storeId;
  int? orderCount;
  String? status;
  String? deletedAt;
  bool? wishlistProduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['category_id'] = categoryId;
    map['sub_category_id'] = subCategoryId;
    map['sku'] = sku;
    map['image'] = image;
    map['description'] = description;
    map['sale_price'] = salePrice;
    map['on_sale_price_status'] = onSalePriceStatus;
    map['product_review'] = productReview;
    map['summer_offer'] = summerOffer;
    map['store_id'] = storeId;
    map['order_count'] = orderCount;
    map['status'] = status;
    map['deleted_at'] = deletedAt;
    map['wishlistProduct'] = wishlistProduct;
    return map;
  }
}

class StoreInfo {
  StoreInfo({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.providerId,
    this.provider,
    this.countryCode,
    this.addressEn,
    this.addressAr,
    this.mapUrl,
    this.userType,
    this.profilePhotoUrl,
    this.status,
    this.storeType,
    this.storeNameEn,
    this.storeNameAr,
    this.phoneTwo,
    this.fax,
    this.website,
    this.workHours,
    this.storeWorkStatus,
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
    this.storeReviews,
  });

  StoreInfo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    providerId = json['provider_id'];
    provider = json['provider'];
    countryCode = json['country_code'];
    addressEn = json['address_en'];
    addressAr = json['address_ar'];
    mapUrl = json['map_url'];
    userType = json['user_type'];
    profilePhotoUrl = json['profile_photo_url'];
    status = json['status'];
    storeType = json['store_type'];
    storeNameEn = json['store_name_en'];
    storeNameAr = json['store_name_ar'];
    phoneTwo = json['phone_two'];
    fax = json['fax'];
    website = json['website'];
    workHours = json['work_hours'];
    storeWorkStatus = json['store_work_status'];
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
    if (json['store_reviews'] != null) {
      storeReviews = [];
      json['store_reviews'].forEach((v) {
        storeReviews!.add(StoreReviews.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? userName;
  String? email;
  String? emailVerifiedAt;
  String? phone;
  String? providerId;
  String? provider;
  String? countryCode;
  String? addressEn;
  String? addressAr;
  String? mapUrl;
  String? userType;
  String? profilePhotoUrl;
  String? status;
  String? storeType;
  String? storeNameEn;
  String? storeNameAr;
  String? phoneTwo;
  String? fax;
  String? website;
  String? workHours;
  String? storeWorkStatus;
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
  List<StoreReviews>? storeReviews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['user_name'] = userName;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['phone'] = phone;
    map['provider_id'] = providerId;
    map['provider'] = provider;
    map['country_code'] = countryCode;
    map['address_en'] = addressEn;
    map['address_ar'] = addressAr;
    map['map_url'] = mapUrl;
    map['user_type'] = userType;
    map['profile_photo_url'] = profilePhotoUrl;
    map['status'] = status;
    map['store_type'] = storeType;
    map['store_name_en'] = storeNameEn;
    map['store_name_ar'] = storeNameAr;
    map['phone_two'] = phoneTwo;
    map['fax'] = fax;
    map['website'] = website;
    map['work_hours'] = workHours;
    map['store_work_status'] = storeWorkStatus;
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
    if (storeReviews != null) {
      map['store_reviews'] = storeReviews!.map((v) => v.toJson()).toList();
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
  });

  StoreReviews.fromJson(dynamic json) {
    id = json['id'];
    customerId = json['customer_id'];
    storeId = json['store_id'];
    reviewValue = json['review_value'];
    reviewNote = json['review_note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? customerId;
  int? storeId;
  int? reviewValue;
  String? reviewNote;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['customer_id'] = customerId;
    map['store_id'] = storeId;
    map['review_value'] = reviewValue;
    map['review_note'] = reviewNote;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
