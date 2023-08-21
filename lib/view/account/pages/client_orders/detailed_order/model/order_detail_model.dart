class OrderDetailModel {
  OrderDetailModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.data,
  });

  OrderDetailModel.fromJson(dynamic json) {
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

class Color {
  Color({
    this.id,
    this.nameEn,
    this.nameAr,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  Color.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? nameEn;
  String? nameAr;
  String? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    map['status'] = status;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
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
    this.storeCity,
    this.storeRegion,
    this.storeStreet,
    this.buildingName,
    this.buildingNumber,
    this.showInHomePage,
    this.freeDeliveryStatus,
    this.authenticatedStatus,
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
    return map;
  }
}

class Order {
  Order({
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
    this.saleOperations,
    this.customer,
  });

  Order.fromJson(dynamic json) {
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
    if (json['sale_operations'] != null) {
      saleOperations = [];
      json['sale_operations'].forEach((v) {
        saleOperations!.add(SaleOperations.fromJson(v));
      });
    }
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
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
  List<SaleOperations>? saleOperations;
  Customer? customer;

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
    if (saleOperations != null) {
      map['sale_operations'] = saleOperations!.map((v) => v.toJson()).toList();
    }
    if (customer != null) {
      map['customer'] = customer!.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.customerName,
    this.phone,
    this.email,
    this.address,
    this.city,
    this.order,
    this.salePerations,
  });

  Data.fromJson(dynamic json) {
    customerName = json['customer_name'];
    phone = json['phone'];
    email = json['email'];
    city = json['city'];
    address = json['address'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    if (json['sale_perations'] != null) {
      salePerations = [];
      json['sale_perations'].forEach((v) {
        salePerations!.add(SalePerations.fromJson(v));
      });
    }
  }
  String? customerName;
  String? phone;
  String? city;
  String? email;
  String? address;
  Order? order;
  List<SalePerations>? salePerations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customer_name'] = customerName;
    map['phone'] = phone;
    map['city'] = city;
    map['email'] = email;
    map['address'] = address;
    if (order != null) {
      map['order'] = order!.toJson();
    }
    if (salePerations != null) {
      map['sale_perations'] = salePerations!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Product {
  Product({
    this.id,
    this.nameEn,
    this.nameAr,
    this.categoryId,
    this.subCategoryId,
    this.sku,
    this.image,
    this.descriptionEn,
    this.descriptionAr,
    this.salePrice,
    this.onSalePriceStatus,
    this.onSalePrice,
    this.productReview,
    this.summerOffer,
    this.storeId,
    this.orderCount,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    sku = json['sku'];
    image = json['image'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    salePrice = json['sale_price'];
    onSalePriceStatus = json['on_sale_price_status'];
    onSalePrice = json['on_sale_price'];
    productReview = json['product_review'];
    summerOffer = json['summer_offer'];
    storeId = json['store_id'];
    orderCount = json['order_count'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? nameEn;
  String? nameAr;
  int? categoryId;
  int? subCategoryId;
  String? sku;
  String? image;
  String? descriptionEn;
  String? descriptionAr;
  String? salePrice;
  String? onSalePriceStatus;
  String? onSalePrice;
  String? productReview;
  String? summerOffer;
  int? storeId;
  int? orderCount;
  String? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    map['category_id'] = categoryId;
    map['sub_category_id'] = subCategoryId;
    map['sku'] = sku;
    map['image'] = image;
    map['description_en'] = descriptionEn;
    map['description_ar'] = descriptionAr;
    map['sale_price'] = salePrice;
    map['on_sale_price_status'] = onSalePriceStatus;
    map['on_sale_price'] = onSalePrice;
    map['product_review'] = productReview;
    map['summer_offer'] = summerOffer;
    map['store_id'] = storeId;
    map['order_count'] = orderCount;
    map['status'] = status;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
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
    this.productName,
    this.colorName,
    this.sizeName,
    this.product,
    this.color,
    this.size,
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
    productName = json['product_name'];
    colorName = json['color_name'];
    sizeName = json['size_name'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    color = json['color'] != null ? Color.fromJson(json['color']) : null;
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
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
  String? productName;
  String? colorName;
  String? sizeName;
  Product? product;
  Color? color;
  Size? size;

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
    map['product_name'] = productName;
    map['color_name'] = colorName;
    map['size_name'] = sizeName;
    if (product != null) {
      map['product'] = product!.toJson();
    }
    if (color != null) {
      map['color'] = color!.toJson();
    }
    if (size != null) {
      map['size'] = size!.toJson();
    }
    return map;
  }
}

class SalePerations {
  SalePerations({
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
    this.productName,
    this.colorName,
    this.sizeName,
    this.product,
    this.color,
    this.size,
  });

  SalePerations.fromJson(dynamic json) {
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
    productName = json['product_name'];
    colorName = json['color_name'];
    sizeName = json['size_name'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    color = json['color'] != null ? Color.fromJson(json['color']) : null;
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
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
  String? productName;
  String? colorName;
  String? sizeName;
  Product? product;
  Color? color;
  Size? size;

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
    map['product_name'] = productName;
    map['color_name'] = colorName;
    map['size_name'] = sizeName;
    if (product != null) {
      map['product'] = product!.toJson();
    }
    if (color != null) {
      map['color'] = color!.toJson();
    }
    if (size != null) {
      map['size'] = size!.toJson();
    }
    return map;
  }
}

class Size {
  Size({
    this.id,
    this.nameEn,
    this.nameAr,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  Size.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? nameEn;
  String? nameAr;
  String? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    map['status'] = status;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
