class MyMessagesModel {
  MyMessagesModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.messages,
  });

  MyMessagesModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['messages'] != null) {
      messages = [];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Messages>? messages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (messages != null) {
      map['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class MessageOperations {
  MessageOperations({
    this.id,
    this.messageId,
    this.senderId,
    this.receiverId,
    this.messageDetails,
    this.messageFile,
    this.deleteType,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  MessageOperations.fromJson(dynamic json) {
    id = json['id'];
    messageId = json['message_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    messageDetails = json['message_details'];
    messageFile = json['message_file'];
    deleteType = json['delete_type'];
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? messageId;
  int? senderId;
  int? receiverId;
  String? messageDetails;
  String? messageFile;
  String? deleteType;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['message_id'] = messageId;
    map['sender_id'] = senderId;
    map['receiver_id'] = receiverId;
    map['message_details'] = messageDetails;
    map['message_file'] = messageFile;
    map['delete_type'] = deleteType;
    map['read_at'] = readAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class Messages {
  Messages({
    this.id,
    this.senderId,
    this.receiverId,
    this.deleteType,
    this.createdAt,
    this.updatedAt,
    this.otherSide,
    this.lastMessageTime,
    this.messageOperations,
    this.receiver,
  });

  Messages.fromJson(dynamic json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    deleteType = json['delete_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    otherSide = json['otherSide'] != null
        ? OtherSide.fromJson(json['otherSide'])
        : null;
    lastMessageTime = json['lastMessageTime'];
    if (json['message_operations'] != null) {
      messageOperations = [];
      json['message_operations'].forEach((v) {
        messageOperations!.add(MessageOperations.fromJson(v));
      });
    }
    receiver =
        json['receiver'] != null ? Receiver.fromJson(json['receiver']) : null;
  }
  int? id;
  int? senderId;
  int? receiverId;
  String? deleteType;
  String? createdAt;
  String? updatedAt;
  OtherSide? otherSide;
  String? lastMessageTime;
  List<MessageOperations>? messageOperations;
  Receiver? receiver;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sender_id'] = senderId;
    map['receiver_id'] = receiverId;
    map['delete_type'] = deleteType;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (otherSide != null) {
      map['otherSide'] = otherSide!.toJson();
    }
    map['lastMessageTime'] = lastMessageTime;
    if (messageOperations != null) {
      map['message_operations'] =
          messageOperations!.map((v) => v.toJson()).toList();
    }
    if (receiver != null) {
      map['receiver'] = receiver!.toJson();
    }
    return map;
  }
}

class OtherSide {
  OtherSide({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.phone,
    this.countryCode,
    this.addressEn,
    this.addressAr,
    this.mapUrl,
    this.latitude,
    this.longitude,
    this.userType,
    this.profilePhotoUrl,
    this.status,
    this.storeType,
    this.storeNameEn,
    this.storeNameAr,
    this.storeDescriptionEn,
    this.storeDescriptionAr,
    this.storeServiceEn,
    this.storeServiceAr,
    this.storeStatus,
    this.storeLocation,
    this.showInHomePage,
    this.freeDeliveryStatus,
    this.authenticatedStatus,
    this.storeReview,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  OtherSide.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['country_code'];
    addressEn = json['address_en'];
    addressAr = json['address_ar'];
    mapUrl = json['map_url'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    userType = json['user_type'];
    profilePhotoUrl = json['profile_photo_url'];
    status = json['status'];
    storeType = json['store_type'];
    storeNameEn = json['store_name_en'];
    storeNameAr = json['store_name_ar'];
    storeDescriptionEn = json['store_description_en'];
    storeDescriptionAr = json['store_description_ar'];
    storeServiceEn = json['store_service_en'];
    storeServiceAr = json['store_service_ar'];
    storeStatus = json['store_status'];
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
  String? phone;
  String? countryCode;
  String? addressEn;
  String? addressAr;
  String? mapUrl;
  String? latitude;
  String? longitude;
  String? userType;
  String? profilePhotoUrl;
  String? status;
  String? storeType;
  String? storeNameEn;
  String? storeNameAr;
  String? storeDescriptionEn;
  String? storeDescriptionAr;
  String? storeServiceEn;
  String? storeServiceAr;
  String? storeStatus;
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
    map['phone'] = phone;
    map['country_code'] = countryCode;
    map['address_en'] = addressEn;
    map['address_ar'] = addressAr;
    map['map_url'] = mapUrl;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['user_type'] = userType;
    map['profile_photo_url'] = profilePhotoUrl;
    map['status'] = status;
    map['store_type'] = storeType;
    map['store_name_en'] = storeNameEn;
    map['store_name_ar'] = storeNameAr;
    map['store_description_en'] = storeDescriptionEn;
    map['store_description_ar'] = storeDescriptionAr;
    map['store_service_en'] = storeServiceEn;
    map['store_service_ar'] = storeServiceAr;
    map['store_status'] = storeStatus;
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

class Receiver {
  Receiver({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.phone,
    this.countryCode,
    this.addressEn,
    this.addressAr,
    this.mapUrl,
    this.latitude,
    this.longitude,
    this.userType,
    this.profilePhotoUrl,
    this.status,
    this.storeType,
    this.storeNameEn,
    this.storeNameAr,
    this.storeDescriptionEn,
    this.storeDescriptionAr,
    this.storeServiceEn,
    this.storeServiceAr,
    this.storeStatus,
    this.storeLocation,
    this.showInHomePage,
    this.freeDeliveryStatus,
    this.storeReview,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  Receiver.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['country_code'];
    addressEn = json['address_en'];
    addressAr = json['address_ar'];
    mapUrl = json['map_url'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    userType = json['user_type'];
    profilePhotoUrl = json['profile_photo_url'];
    status = json['status'];
    storeType = json['store_type'];
    storeNameEn = json['store_name_en'];
    storeNameAr = json['store_name_ar'];
    storeDescriptionEn = json['store_description_en'];
    storeDescriptionAr = json['store_description_ar'];
    storeServiceEn = json['store_service_en'];
    storeServiceAr = json['store_service_ar'];
    storeStatus = json['store_status'];
    storeLocation = json['store_location'];
    showInHomePage = json['show_in_home_page'];
    freeDeliveryStatus = json['free_delivery_status'];
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
  String? mapUrl;
  String? latitude;
  String? longitude;
  String? userType;
  String? profilePhotoUrl;
  String? status;
  String? storeType;
  String? storeNameEn;
  String? storeNameAr;
  String? storeDescriptionEn;
  String? storeDescriptionAr;
  String? storeServiceEn;
  String? storeServiceAr;
  String? storeStatus;
  String? storeLocation;
  String? showInHomePage;
  String? freeDeliveryStatus;
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
    map['map_url'] = mapUrl;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['user_type'] = userType;
    map['profile_photo_url'] = profilePhotoUrl;
    map['status'] = status;
    map['store_type'] = storeType;
    map['store_name_en'] = storeNameEn;
    map['store_name_ar'] = storeNameAr;
    map['store_description_en'] = storeDescriptionEn;
    map['store_description_ar'] = storeDescriptionAr;
    map['store_service_en'] = storeServiceEn;
    map['store_service_ar'] = storeServiceAr;
    map['store_status'] = storeStatus;
    map['store_location'] = storeLocation;
    map['show_in_home_page'] = showInHomePage;
    map['free_delivery_status'] = freeDeliveryStatus;
    map['store_review'] = storeReview;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
