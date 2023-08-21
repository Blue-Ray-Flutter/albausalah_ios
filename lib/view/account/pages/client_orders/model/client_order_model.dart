class ClientOrderModel {
  ClientOrderModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.pendingOrders,
    this.finishOrders,
  });

  ClientOrderModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['pendingOrders'] != null) {
      pendingOrders = [];
      json['pendingOrders'].forEach((v) {
        pendingOrders!.add(PendingOrders.fromJson(v));
      });
    }
    if (json['finishOrders'] != null) {
      finishOrders = [];
      json['finishOrders'].forEach((v) {
        finishOrders!.add(FinishOrders.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<PendingOrders>? pendingOrders;
  List<FinishOrders>? finishOrders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (pendingOrders != null) {
      map['pendingOrders'] = pendingOrders!.map((v) => v.toJson()).toList();
    }
    if (finishOrders != null) {
      map['finishOrders'] = finishOrders!.map((v) => v.toJson()).toList();
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
    this.storeWorkStatus,
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

  Customer.fromJson(dynamic json) {
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
    storeWorkStatus = json['store_work_status'];
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
  String? storeWorkStatus;
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
    map['store_work_status'] = storeWorkStatus;
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
    this.createdAt,
    this.updatedAt,
    this.customerName,
    this.customer,
    this.saleOperations,
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customerName = json['customer_name'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['sale_operations'] != null) {
      saleOperations = [];
      json['sale_operations'].forEach((v) {
        saleOperations!.add(SaleOperations.fromJson(v));
      });
    }
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
  String? customerName;
  Customer? customer;
  List<SaleOperations>? saleOperations;

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
    map['customer_name'] = customerName;
    if (customer != null) {
      map['customer'] = customer!.toJson();
    }
    if (saleOperations != null) {
      map['sale_operations'] = saleOperations!.map((v) => v.toJson()).toList();
    }
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
    this.createdAt,
    this.updatedAt,
    this.customerName,
    this.customer,
    this.saleOperations,
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customerName = json['customer_name'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['sale_operations'] != null) {
      saleOperations = [];
      json['sale_operations'].forEach((v) {
        saleOperations!.add(SaleOperations.fromJson(v));
      });
    }
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
  String? customerName;
  Customer? customer;
  List<SaleOperations>? saleOperations;

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
    map['customer_name'] = customerName;
    if (customer != null) {
      map['customer'] = customer!.toJson();
    }
    if (saleOperations != null) {
      map['sale_operations'] = saleOperations!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SaleOperations {
  SaleOperations({
    this.id,
    this.saleId,
    this.productId,
    this.sizeId,
    this.colorId,
    this.quantity,
    this.subTotal,
    this.endTotal,
    this.endTax,
    this.createdAt,
    this.updatedAt,
  });

  SaleOperations.fromJson(dynamic json) {
    id = json['id'];
    saleId = json['sale_id'];
    productId = json['product_id'];
    sizeId = json['size_id'];
    colorId = json['color_id'];
    quantity = json['quantity'];
    subTotal = json['sub_total'];
    endTotal = json['end_total'];
    endTax = json['end_tax'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? saleId;
  int? productId;
  int? sizeId;
  int? colorId;
  int? quantity;
  String? subTotal;
  String? endTotal;
  String? endTax;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sale_id'] = saleId;
    map['product_id'] = productId;
    map['size_id'] = sizeId;
    map['color_id'] = colorId;
    map['quantity'] = quantity;
    map['sub_total'] = subTotal;
    map['end_total'] = endTotal;
    map['end_tax'] = endTax;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
