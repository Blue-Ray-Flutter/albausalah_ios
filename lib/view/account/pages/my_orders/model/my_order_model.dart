class MyOrderModel {
  MyOrderModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.sales,
  });

  MyOrderModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['sales'] != null) {
      sales = [];
      json['sales'].forEach((v) {
        sales!.add(Sales.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Sales>? sales;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (sales != null) {
      map['sales'] = sales!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Sales {
  Sales({
    this.id,
    this.userId,
    this.storeId,
    this.subTotal,
    this.endTotal,
    this.endTax,
    this.productCount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.store,
  });

  Sales.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    storeId = json['store_id'];
    subTotal = json['sub_total'];
    endTotal = json['end_total'];
    endTax = json['end_tax'];
    productCount = json['product_count'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
  }
  int? id;
  int? userId;
  int? storeId;
  String? subTotal;
  String? endTotal;
  String? endTax;
  int? productCount;
  String? status;
  String? createdAt;
  String? updatedAt;
  Store? store;

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
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (store != null) {
      map['store'] = store!.toJson();
    }
    return map;
  }
}

class Store {
  Store({
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
    this.latitude,
    this.longitude,
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
    this.showInHomePage,
    this.freeDeliveryStatus,
    this.authenticatedStatus,
    this.storeReview,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.address,
  });

  Store.fromJson(dynamic json) {
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
    latitude = json['latitude'];
    longitude = json['longitude'];
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
    showInHomePage = json['show_in_home_page'];
    freeDeliveryStatus = json['free_delivery_status'];
    authenticatedStatus = json['authenticated_status'];
    storeReview = json['store_review'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    address = json['address'];
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
  String? latitude;
  String? longitude;
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
  String? showInHomePage;
  String? freeDeliveryStatus;
  String? authenticatedStatus;
  String? storeReview;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? address;

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
    map['latitude'] = latitude;
    map['longitude'] = longitude;
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
    map['show_in_home_page'] = showInHomePage;
    map['free_delivery_status'] = freeDeliveryStatus;
    map['authenticated_status'] = authenticatedStatus;
    map['store_review'] = storeReview;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['address'] = address;
    return map;
  }
}
