class LoginModel {
  LoginModel({
    this.status,
    this.success,
    this.requestDate,
    this.token,
    this.msg,
    this.userType,
    this.userData,
  });

  LoginModel.fromJson(dynamic json) {
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
    this.mapUrl,
    this.userType,
    this.profilePhotoUrl,
    this.status,
    this.storeType,
    this.phoneTwo,
    this.fax,
    this.website,
    this.workHours,
    this.storeWorkStatus,
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
    mapUrl = json['map_url'];
    userType = json['user_type'];
    profilePhotoUrl = json['profile_photo_url'];
    status = json['status'];
    storeType = json['store_type'];
    phoneTwo = json['phone_two'];
    fax = json['fax'];
    website = json['website'];
    workHours = json['work_hours'];
    storeWorkStatus = json['store_work_status'];
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
  String? mapUrl;
  String? userType;
  String? profilePhotoUrl;
  String? status;
  String? storeType;
  String? phoneTwo;
  String? fax;
  String? website;
  String? workHours;
  String? storeWorkStatus;
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
    map['map_url'] = mapUrl;
    map['user_type'] = userType;
    map['profile_photo_url'] = profilePhotoUrl;
    map['status'] = status;
    map['store_type'] = storeType;
    map['phone_two'] = phoneTwo;
    map['fax'] = fax;
    map['website'] = website;
    map['work_hours'] = workHours;
    map['store_work_status'] = storeWorkStatus;
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
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
