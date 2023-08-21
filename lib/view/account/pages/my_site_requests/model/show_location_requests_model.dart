import 'dart:convert';

ShowLocationRequestsModel showLocationRequestsModelFromJson(String str) =>
    ShowLocationRequestsModel.fromJson(json.decode(str));
String showLocationRequestsModelToJson(ShowLocationRequestsModel data) =>
    json.encode(data.toJson());

class ShowLocationRequestsModel {
  ShowLocationRequestsModel({
    int? status,
    bool? success,
    String? requestDate,
    String? msg,
    List<LocationInquiries>? locationInquiries,
  }) {
    _status = status;
    _success = success;
    _requestDate = requestDate;
    _msg = msg;
    _locationInquiries = locationInquiries;
  }

  ShowLocationRequestsModel.fromJson(dynamic json) {
    _status = json['status'];
    _success = json['success'];
    _requestDate = json['request_date'];
    _msg = json['msg'];
    if (json['locationInquiries'] != null) {
      _locationInquiries = [];
      json['locationInquiries'].forEach((v) {
        _locationInquiries?.add(LocationInquiries.fromJson(v));
      });
    }
  }
  int? _status;
  bool? _success;
  String? _requestDate;
  String? _msg;
  List<LocationInquiries>? _locationInquiries;
  ShowLocationRequestsModel copyWith({
    int? status,
    bool? success,
    String? requestDate,
    String? msg,
    List<LocationInquiries>? locationInquiries,
  }) =>
      ShowLocationRequestsModel(
        status: status ?? _status,
        success: success ?? _success,
        requestDate: requestDate ?? _requestDate,
        msg: msg ?? _msg,
        locationInquiries: locationInquiries ?? _locationInquiries,
      );
  int? get status => _status;
  bool? get success => _success;
  String? get requestDate => _requestDate;
  String? get msg => _msg;
  List<LocationInquiries>? get locationInquiries => _locationInquiries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['success'] = _success;
    map['request_date'] = _requestDate;
    map['msg'] = _msg;
    if (_locationInquiries != null) {
      map['locationInquiries'] =
          _locationInquiries?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 3
/// receiver_id : 1
/// sender_id : 3
/// request_status : "Rejected"
/// latitude : ""
/// longitude : ""
/// created_at : "2023-06-05T12:30:20.000000Z"
/// updated_at : "2023-06-05T13:47:43.000000Z"
/// customer_name : "Store Test EN"
/// phone : "0788314139"
/// customer : {"id":3,"name":"mahmoud alkhdour99","user_name":"mahmoud_alkhdour91","email":"hhh770494@gmail.com","email_verified_at":"","phone":"0788314139","provider_id":"","provider":"","provider_token":"","provider_refresh_token":"","country_code":"962","address_en":"K. Faysal Ben Abdul Aziz St. 25, Wadi As-Seir, Amman, Amman Governorate, Jordan","address_ar":"K. Faysal Ben Abdul Aziz St. 25, Wadi As-Seir, Amman, Amman Governorate, Jordan","latitude":"31.964590453450718","longitude":"35.870361328125","user_type":"Store","profile_photo_url":"storage/images/profilePhotos/1768033233437323.jpg","status":"Active","store_type":"Actual","store_name_en":"Store Test EN","store_name_ar":"Store Test EN","phone_two":"","fax":"","website":"","work_hours":"","store_work_status":"","about_store_en":"","about_store_ar":"","store_description_en":"Store Desc EN","store_description_ar":"Store Desc EN","store_service_en":"Store Service EN","store_service_ar":"Store Service EN","store_status":"Active","store_location":"","store_city":"1329","store_region":"Bagdad","store_street":"street","building_name":"New Building","building_number":22,"mailbox":123,"postal_code":123,"show_in_home_page":"Active","free_delivery_status":"Free Delivery","authenticated_status":"","store_review":"0.00","store_id":"","deleted_at":"","created_at":"2023-06-05T12:30:20.000000Z","updated_at":"2023-06-07T08:51:25.000000Z"}

LocationInquiries locationInquiriesFromJson(String str) =>
    LocationInquiries.fromJson(json.decode(str));
String locationInquiriesToJson(LocationInquiries data) =>
    json.encode(data.toJson());

class LocationInquiries {
  LocationInquiries({
    int? id,
    int? receiverId,
    int? senderId,
    String? requestStatus,
    String? latitude,
    String? longitude,
    String? createdAt,
    String? updatedAt,
    String? customerName,
    String? phone,
    Customer? customer,
  }) {
    _id = id;
    _receiverId = receiverId;
    _senderId = senderId;
    _requestStatus = requestStatus;
    _latitude = latitude;
    _longitude = longitude;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _customerName = customerName;
    _phone = phone;
    _customer = customer;
  }

  LocationInquiries.fromJson(dynamic json) {
    _id = json['id'];
    _receiverId = json['receiver_id'];
    _senderId = json['sender_id'];
    _requestStatus = json['request_status'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _customerName = json['customer_name'];
    _phone = json['phone'];
    _customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }
  int? _id;
  int? _receiverId;
  int? _senderId;
  String? _requestStatus;
  String? _latitude;
  String? _longitude;
  String? _createdAt;
  String? _updatedAt;
  String? _customerName;
  String? _phone;
  Customer? _customer;
  LocationInquiries copyWith({
    int? id,
    int? receiverId,
    int? senderId,
    String? requestStatus,
    String? latitude,
    String? longitude,
    String? createdAt,
    String? updatedAt,
    String? customerName,
    String? phone,
    Customer? customer,
  }) =>
      LocationInquiries(
        id: id ?? _id,
        receiverId: receiverId ?? _receiverId,
        senderId: senderId ?? _senderId,
        requestStatus: requestStatus ?? _requestStatus,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        customerName: customerName ?? _customerName,
        phone: phone ?? _phone,
        customer: customer ?? _customer,
      );
  int? get id => _id;
  int? get receiverId => _receiverId;
  int? get senderId => _senderId;
  String? get requestStatus => _requestStatus;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get customerName => _customerName;
  String? get phone => _phone;
  Customer? get customer => _customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['receiver_id'] = _receiverId;
    map['sender_id'] = _senderId;
    map['request_status'] = _requestStatus;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['customer_name'] = _customerName;
    map['phone'] = _phone;
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    return map;
  }
}

/// id : 3
/// name : "mahmoud alkhdour99"
/// user_name : "mahmoud_alkhdour91"
/// email : "hhh770494@gmail.com"
/// email_verified_at : ""
/// phone : "0788314139"
/// provider_id : ""
/// provider : ""
/// provider_token : ""
/// provider_refresh_token : ""
/// country_code : "962"
/// address_en : "K. Faysal Ben Abdul Aziz St. 25, Wadi As-Seir, Amman, Amman Governorate, Jordan"
/// address_ar : "K. Faysal Ben Abdul Aziz St. 25, Wadi As-Seir, Amman, Amman Governorate, Jordan"
/// latitude : "31.964590453450718"
/// longitude : "35.870361328125"
/// user_type : "Store"
/// profile_photo_url : "storage/images/profilePhotos/1768033233437323.jpg"
/// status : "Active"
/// store_type : "Actual"
/// store_name_en : "Store Test EN"
/// store_name_ar : "Store Test EN"
/// phone_two : ""
/// fax : ""
/// website : ""
/// work_hours : ""
/// store_work_status : ""
/// about_store_en : ""
/// about_store_ar : ""
/// store_description_en : "Store Desc EN"
/// store_description_ar : "Store Desc EN"
/// store_service_en : "Store Service EN"
/// store_service_ar : "Store Service EN"
/// store_status : "Active"
/// store_location : ""
/// store_city : "1329"
/// store_region : "Bagdad"
/// store_street : "street"
/// building_name : "New Building"
/// building_number : 22
/// mailbox : 123
/// postal_code : 123
/// show_in_home_page : "Active"
/// free_delivery_status : "Free Delivery"
/// authenticated_status : ""
/// store_review : "0.00"
/// store_id : ""
/// deleted_at : ""
/// created_at : "2023-06-05T12:30:20.000000Z"
/// updated_at : "2023-06-07T08:51:25.000000Z"

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));
String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    int? id,
    String? name,
    String? userName,
    String? email,
    String? emailVerifiedAt,
    String? phone,
    String? providerId,
    String? provider,
    String? providerToken,
    String? providerRefreshToken,
    String? countryCode,
    String? addressEn,
    String? addressAr,
    String? latitude,
    String? longitude,
    String? userType,
    String? profilePhotoUrl,
    String? status,
    String? storeType,
    String? storeNameEn,
    String? storeNameAr,
    String? phoneTwo,
    String? fax,
    String? website,
    String? workHours,
    String? storeWorkStatus,
    String? aboutStoreEn,
    String? aboutStoreAr,
    String? storeDescriptionEn,
    String? storeDescriptionAr,
    String? storeServiceEn,
    String? storeServiceAr,
    String? storeStatus,
    String? storeLocation,
    String? storeCity,
    String? storeRegion,
    String? storeStreet,
    String? buildingName,
    int? buildingNumber,
    int? mailbox,
    int? postalCode,
    String? showInHomePage,
    String? freeDeliveryStatus,
    String? authenticatedStatus,
    String? storeReview,
    String? storeId,
    String? deletedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _userName = userName;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _phone = phone;
    _providerId = providerId;
    _provider = provider;
    _providerToken = providerToken;
    _providerRefreshToken = providerRefreshToken;
    _countryCode = countryCode;
    _addressEn = addressEn;
    _addressAr = addressAr;
    _latitude = latitude;
    _longitude = longitude;
    _userType = userType;
    _profilePhotoUrl = profilePhotoUrl;
    _status = status;
    _storeType = storeType;
    _storeNameEn = storeNameEn;
    _storeNameAr = storeNameAr;
    _phoneTwo = phoneTwo;
    _fax = fax;
    _website = website;
    _workHours = workHours;
    _storeWorkStatus = storeWorkStatus;
    _aboutStoreEn = aboutStoreEn;
    _aboutStoreAr = aboutStoreAr;
    _storeDescriptionEn = storeDescriptionEn;
    _storeDescriptionAr = storeDescriptionAr;
    _storeServiceEn = storeServiceEn;
    _storeServiceAr = storeServiceAr;
    _storeStatus = storeStatus;
    _storeLocation = storeLocation;
    _storeCity = storeCity;
    _storeRegion = storeRegion;
    _storeStreet = storeStreet;
    _buildingName = buildingName;
    _buildingNumber = buildingNumber;
    _mailbox = mailbox;
    _postalCode = postalCode;
    _showInHomePage = showInHomePage;
    _freeDeliveryStatus = freeDeliveryStatus;
    _authenticatedStatus = authenticatedStatus;
    _storeReview = storeReview;
    _storeId = storeId;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _userName = json['user_name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _phone = json['phone'];
    _providerId = json['provider_id'];
    _provider = json['provider'];
    _providerToken = json['provider_token'];
    _providerRefreshToken = json['provider_refresh_token'];
    _countryCode = json['country_code'];
    _addressEn = json['address_en'];
    _addressAr = json['address_ar'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _userType = json['user_type'];
    _profilePhotoUrl = json['profile_photo_url'];
    _status = json['status'];
    _storeType = json['store_type'];
    _storeNameEn = json['store_name_en'];
    _storeNameAr = json['store_name_ar'];
    _phoneTwo = json['phone_two'];
    _fax = json['fax'];
    _website = json['website'];
    _workHours = json['work_hours'];
    _storeWorkStatus = json['store_work_status'];
    _aboutStoreEn = json['about_store_en'];
    _aboutStoreAr = json['about_store_ar'];
    _storeDescriptionEn = json['store_description_en'];
    _storeDescriptionAr = json['store_description_ar'];
    _storeServiceEn = json['store_service_en'];
    _storeServiceAr = json['store_service_ar'];
    _storeStatus = json['store_status'];
    _storeLocation = json['store_location'];
    _storeCity = json['store_city'];
    _storeRegion = json['store_region'];
    _storeStreet = json['store_street'];
    _buildingName = json['building_name'];
    _buildingNumber = json['building_number'];
    _mailbox = json['mailbox'];
    _postalCode = json['postal_code'];
    _showInHomePage = json['show_in_home_page'];
    _freeDeliveryStatus = json['free_delivery_status'];
    _authenticatedStatus = json['authenticated_status'];
    _storeReview = json['store_review'];
    _storeId = json['store_id'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _userName;
  String? _email;
  String? _emailVerifiedAt;
  String? _phone;
  String? _providerId;
  String? _provider;
  String? _providerToken;
  String? _providerRefreshToken;
  String? _countryCode;
  String? _addressEn;
  String? _addressAr;
  String? _latitude;
  String? _longitude;
  String? _userType;
  String? _profilePhotoUrl;
  String? _status;
  String? _storeType;
  String? _storeNameEn;
  String? _storeNameAr;
  String? _phoneTwo;
  String? _fax;
  String? _website;
  String? _workHours;
  String? _storeWorkStatus;
  String? _aboutStoreEn;
  String? _aboutStoreAr;
  String? _storeDescriptionEn;
  String? _storeDescriptionAr;
  String? _storeServiceEn;
  String? _storeServiceAr;
  String? _storeStatus;
  String? _storeLocation;
  String? _storeCity;
  String? _storeRegion;
  String? _storeStreet;
  String? _buildingName;
  int? _buildingNumber;
  int? _mailbox;
  int? _postalCode;
  String? _showInHomePage;
  String? _freeDeliveryStatus;
  String? _authenticatedStatus;
  String? _storeReview;
  String? _storeId;
  String? _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  Customer copyWith({
    int? id,
    String? name,
    String? userName,
    String? email,
    String? emailVerifiedAt,
    String? phone,
    String? providerId,
    String? provider,
    String? providerToken,
    String? providerRefreshToken,
    String? countryCode,
    String? addressEn,
    String? addressAr,
    String? latitude,
    String? longitude,
    String? userType,
    String? profilePhotoUrl,
    String? status,
    String? storeType,
    String? storeNameEn,
    String? storeNameAr,
    String? phoneTwo,
    String? fax,
    String? website,
    String? workHours,
    String? storeWorkStatus,
    String? aboutStoreEn,
    String? aboutStoreAr,
    String? storeDescriptionEn,
    String? storeDescriptionAr,
    String? storeServiceEn,
    String? storeServiceAr,
    String? storeStatus,
    String? storeLocation,
    String? storeCity,
    String? storeRegion,
    String? storeStreet,
    String? buildingName,
    int? buildingNumber,
    int? mailbox,
    int? postalCode,
    String? showInHomePage,
    String? freeDeliveryStatus,
    String? authenticatedStatus,
    String? storeReview,
    String? storeId,
    String? deletedAt,
    String? createdAt,
    String? updatedAt,
  }) =>
      Customer(
        id: id ?? _id,
        name: name ?? _name,
        userName: userName ?? _userName,
        email: email ?? _email,
        emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
        phone: phone ?? _phone,
        providerId: providerId ?? _providerId,
        provider: provider ?? _provider,
        providerToken: providerToken ?? _providerToken,
        providerRefreshToken: providerRefreshToken ?? _providerRefreshToken,
        countryCode: countryCode ?? _countryCode,
        addressEn: addressEn ?? _addressEn,
        addressAr: addressAr ?? _addressAr,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        userType: userType ?? _userType,
        profilePhotoUrl: profilePhotoUrl ?? _profilePhotoUrl,
        status: status ?? _status,
        storeType: storeType ?? _storeType,
        storeNameEn: storeNameEn ?? _storeNameEn,
        storeNameAr: storeNameAr ?? _storeNameAr,
        phoneTwo: phoneTwo ?? _phoneTwo,
        fax: fax ?? _fax,
        website: website ?? _website,
        workHours: workHours ?? _workHours,
        storeWorkStatus: storeWorkStatus ?? _storeWorkStatus,
        aboutStoreEn: aboutStoreEn ?? _aboutStoreEn,
        aboutStoreAr: aboutStoreAr ?? _aboutStoreAr,
        storeDescriptionEn: storeDescriptionEn ?? _storeDescriptionEn,
        storeDescriptionAr: storeDescriptionAr ?? _storeDescriptionAr,
        storeServiceEn: storeServiceEn ?? _storeServiceEn,
        storeServiceAr: storeServiceAr ?? _storeServiceAr,
        storeStatus: storeStatus ?? _storeStatus,
        storeLocation: storeLocation ?? _storeLocation,
        storeCity: storeCity ?? _storeCity,
        storeRegion: storeRegion ?? _storeRegion,
        storeStreet: storeStreet ?? _storeStreet,
        buildingName: buildingName ?? _buildingName,
        buildingNumber: buildingNumber ?? _buildingNumber,
        mailbox: mailbox ?? _mailbox,
        postalCode: postalCode ?? _postalCode,
        showInHomePage: showInHomePage ?? _showInHomePage,
        freeDeliveryStatus: freeDeliveryStatus ?? _freeDeliveryStatus,
        authenticatedStatus: authenticatedStatus ?? _authenticatedStatus,
        storeReview: storeReview ?? _storeReview,
        storeId: storeId ?? _storeId,
        deletedAt: deletedAt ?? _deletedAt,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int? get id => _id;
  String? get name => _name;
  String? get userName => _userName;
  String? get email => _email;
  String? get emailVerifiedAt => _emailVerifiedAt;
  String? get phone => _phone;
  String? get providerId => _providerId;
  String? get provider => _provider;
  String? get providerToken => _providerToken;
  String? get providerRefreshToken => _providerRefreshToken;
  String? get countryCode => _countryCode;
  String? get addressEn => _addressEn;
  String? get addressAr => _addressAr;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get userType => _userType;
  String? get profilePhotoUrl => _profilePhotoUrl;
  String? get status => _status;
  String? get storeType => _storeType;
  String? get storeNameEn => _storeNameEn;
  String? get storeNameAr => _storeNameAr;
  String? get phoneTwo => _phoneTwo;
  String? get fax => _fax;
  String? get website => _website;
  String? get workHours => _workHours;
  String? get storeWorkStatus => _storeWorkStatus;
  String? get aboutStoreEn => _aboutStoreEn;
  String? get aboutStoreAr => _aboutStoreAr;
  String? get storeDescriptionEn => _storeDescriptionEn;
  String? get storeDescriptionAr => _storeDescriptionAr;
  String? get storeServiceEn => _storeServiceEn;
  String? get storeServiceAr => _storeServiceAr;
  String? get storeStatus => _storeStatus;
  String? get storeLocation => _storeLocation;
  String? get storeCity => _storeCity;
  String? get storeRegion => _storeRegion;
  String? get storeStreet => _storeStreet;
  String? get buildingName => _buildingName;
  int? get buildingNumber => _buildingNumber;
  int? get mailbox => _mailbox;
  int? get postalCode => _postalCode;
  String? get showInHomePage => _showInHomePage;
  String? get freeDeliveryStatus => _freeDeliveryStatus;
  String? get authenticatedStatus => _authenticatedStatus;
  String? get storeReview => _storeReview;
  String? get storeId => _storeId;
  String? get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['user_name'] = _userName;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['phone'] = _phone;
    map['provider_id'] = _providerId;
    map['provider'] = _provider;
    map['provider_token'] = _providerToken;
    map['provider_refresh_token'] = _providerRefreshToken;
    map['country_code'] = _countryCode;
    map['address_en'] = _addressEn;
    map['address_ar'] = _addressAr;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['user_type'] = _userType;
    map['profile_photo_url'] = _profilePhotoUrl;
    map['status'] = _status;
    map['store_type'] = _storeType;
    map['store_name_en'] = _storeNameEn;
    map['store_name_ar'] = _storeNameAr;
    map['phone_two'] = _phoneTwo;
    map['fax'] = _fax;
    map['website'] = _website;
    map['work_hours'] = _workHours;
    map['store_work_status'] = _storeWorkStatus;
    map['about_store_en'] = _aboutStoreEn;
    map['about_store_ar'] = _aboutStoreAr;
    map['store_description_en'] = _storeDescriptionEn;
    map['store_description_ar'] = _storeDescriptionAr;
    map['store_service_en'] = _storeServiceEn;
    map['store_service_ar'] = _storeServiceAr;
    map['store_status'] = _storeStatus;
    map['store_location'] = _storeLocation;
    map['store_city'] = _storeCity;
    map['store_region'] = _storeRegion;
    map['store_street'] = _storeStreet;
    map['building_name'] = _buildingName;
    map['building_number'] = _buildingNumber;
    map['mailbox'] = _mailbox;
    map['postal_code'] = _postalCode;
    map['show_in_home_page'] = _showInHomePage;
    map['free_delivery_status'] = _freeDeliveryStatus;
    map['authenticated_status'] = _authenticatedStatus;
    map['store_review'] = _storeReview;
    map['store_id'] = _storeId;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
