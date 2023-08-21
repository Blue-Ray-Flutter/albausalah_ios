class RegisterModel {
  RegisterModel({
    this.status,
    this.success,
    this.requestDate,
    this.token,
    this.msg,
    this.userType,
    this.userData,
  });

  RegisterModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    token = json['token'];
    msg = json['msg'];
    userType = json['user_type'];
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
  }
  int? status;
  bool? success;
  String? requestDate;
  String? token;
  String? msg;
  String? userType;
  UserData? userData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['token'] = token;
    map['msg'] = msg;
    map['user_type'] = userType;
    if (userData != null) {
      map['user_data'] = userData!.toJson();
    }
    return map;
  }
}

class UserData {
  UserData({
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
    this.userType,
    this.profilePhotoUrl,
    this.status,
    this.storeType,
    this.storeLocation,
    this.showInHomePage,
    this.freeDeliveryStatus,
    this.authenticatedStatus,
    this.storeReview,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  UserData.fromJson(dynamic json) {
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
    userType = json['user_type'];
    profilePhotoUrl = json['profile_photo_url'];
    status = json['status'];
    storeType = json['store_type'];
    storeLocation = json['store_location'];
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
  String? emailVerifiedAt;
  String? phone;
  String? providerId;
  String? provider;
  String? countryCode;
  String? addressEn;
  String? addressAr;
  String? userType;
  String? profilePhotoUrl;
  String? status;
  String? storeType;
  String? storeLocation;
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
    map['email_verified_at'] = emailVerifiedAt;
    map['phone'] = phone;
    map['provider_id'] = providerId;
    map['provider'] = provider;
    map['country_code'] = countryCode;
    map['address_en'] = addressEn;
    map['address_ar'] = addressAr;
    map['user_type'] = userType;
    map['profile_photo_url'] = profilePhotoUrl;
    map['status'] = status;
    map['store_type'] = storeType;
    map['store_location'] = storeLocation;
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
