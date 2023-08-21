class FavoriteStoreModel {
  FavoriteStoreModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.stores,
  });

  FavoriteStoreModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['stores'] != null) {
      stores = [];
      json['stores'].forEach((v) {
        stores!.add(Stores.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Stores>? stores;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (stores != null) {
      map['stores'] = stores!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Stores {
  Stores({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.phone,
    this.providerId,
    this.provider,
    this.countryCode,
    this.address,
    this.profilePhotoUrl,
    this.status,
    this.storeType,
    this.storeName,
    this.storeWorkStatus,
    this.aboutStore,
    this.sroreDescription,
    this.storeServie,
    this.storeStatus,
    this.storeLocation,
    this.storeCity,
    this.storeRegion,
    this.storeStreet,
    this.buildingName,
    this.buildingNumber,
    this.showInHomePage,
    this.freeDeliveryStatus,
    this.storeReview,
    this.authenticatedStatus,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.followStore,
  });

  Stores.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    providerId = json['provider_id'];
    provider = json['provider'];
    countryCode = json['country_code'];
    address = json['address'];
    profilePhotoUrl = json['profile_photo_url'];
    status = json['status'];
    storeType = json['store_type'];
    storeName = json['store_name'];
    storeWorkStatus = json['store_work_status'];
    aboutStore = json['about_store'];
    sroreDescription = json['srore_description'];
    storeServie = json['store_servie'];
    storeStatus = json['store_status'];
    storeLocation = json['store_location'];
    storeCity = json['store_city'];
    storeRegion = json['store_region'];
    storeStreet = json['store_street'];
    buildingName = json['building_name'];
    buildingNumber = json['building_number'];
    showInHomePage = json['show_in_home_page'];
    freeDeliveryStatus = json['free_delivery_status'];
    storeReview = json['store_review'];
    authenticatedStatus = json['authenticated_status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    followStore = json['followStore'];
  }
  int? id;
  String? name;
  String? userName;
  String? email;
  String? phone;
  String? providerId;
  String? provider;
  String? countryCode;
  String? address;
  String? profilePhotoUrl;
  String? status;
  String? storeType;
  String? storeName;
  String? storeWorkStatus;
  String? aboutStore;
  String? sroreDescription;
  String? storeServie;
  String? storeStatus;
  String? storeLocation;
  String? storeCity;
  String? storeRegion;
  String? storeStreet;
  String? buildingName;
  int? buildingNumber;
  String? showInHomePage;
  String? freeDeliveryStatus;
  String? storeReview;
  String? authenticatedStatus;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  bool? followStore;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['user_name'] = userName;
    map['email'] = email;
    map['phone'] = phone;
    map['provider_id'] = providerId;
    map['provider'] = provider;
    map['country_code'] = countryCode;
    map['address'] = address;
    map['profile_photo_url'] = profilePhotoUrl;
    map['status'] = status;
    map['store_type'] = storeType;
    map['store_name'] = storeName;
    map['store_work_status'] = storeWorkStatus;
    map['about_store'] = aboutStore;
    map['srore_description'] = sroreDescription;
    map['store_servie'] = storeServie;
    map['store_status'] = storeStatus;
    map['store_location'] = storeLocation;
    map['store_city'] = storeCity;
    map['store_region'] = storeRegion;
    map['store_street'] = storeStreet;
    map['building_name'] = buildingName;
    map['building_number'] = buildingNumber;
    map['show_in_home_page'] = showInHomePage;
    map['free_delivery_status'] = freeDeliveryStatus;
    map['store_review'] = storeReview;
    map['authenticated_status'] = authenticatedStatus;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['followStore'] = followStore;

    return map;
  }
}
