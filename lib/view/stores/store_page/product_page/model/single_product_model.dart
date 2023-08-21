class SingleProductModel {
  SingleProductModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.data,
  });

  SingleProductModel.fromJson(dynamic json) {
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

class SingleProduct {
  SingleProduct({
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
    this.categoryName,
  });

  SingleProduct.fromJson(dynamic json) {
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
    categoryName = json['category_name'];
    storeId = json['store_id'];
    orderCount = json['order_count'];
    status = json['status'];
    deletedAt = json['deleted_at'];
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
  String? categoryName;
  int? storeId;
  int? orderCount;
  String? status;
  String? deletedAt;

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
    map['category_name'] = categoryName;
    return map;
  }
}

class Data {
  Data({
    this.singleProduct,
    this.relatedPrdoducts,
    this.wishlistProduct,
    this.otherImages,
  });

  Data.fromJson(dynamic json) {
    wishlistProduct = json['wishlistProduct'];
    singleProduct = json['singleProduct'] != null
        ? SingleProduct.fromJson(json['singleProduct'])
        : null;
    if (json['relatedPrdoducts'] != null) {
      relatedPrdoducts = [];
      json['relatedPrdoducts'].forEach((v) {
        relatedPrdoducts!.add(RelatedPrdoducts.fromJson(v));
      });
    }
    if (json['other_images'] != null) {
      otherImages = [];
      json['other_images'].forEach((v) {
        otherImages!.add(OtherImages.fromJson(v));
      });
    }
  }

  SingleProduct? singleProduct;
  List<RelatedPrdoducts>? relatedPrdoducts;
  bool? wishlistProduct;
  List<OtherImages>? otherImages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wishlistProduct'] = wishlistProduct;
    if (singleProduct != null) {
      map['singleProduct'] = singleProduct!.toJson();
    }
    if (relatedPrdoducts != null) {
      map['relatedPrdoducts'] =
          relatedPrdoducts!.map((v) => v.toJson()).toList();
    }
    if (otherImages != null) {
      map['other_images'] = otherImages!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class RelatedPrdoducts {
  RelatedPrdoducts({
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
  });

  RelatedPrdoducts.fromJson(dynamic json) {
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
    return map;
  }
}

class OtherImages {
  OtherImages({
    this.id,
    this.productId,
    this.image,
  });

  OtherImages.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
  }
  int? id;
  String? productId;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['image'] = image;
    return map;
  }
}
