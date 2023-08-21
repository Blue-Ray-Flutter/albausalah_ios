class MyProductsModel {
  MyProductsModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.products,
  });

  MyProductsModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (products != null) {
      map['products'] = products!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Products {
  Products({
    this.id,
    this.name,
    this.categoryId,
    this.subCategoryId,
    this.sku,
    this.image,
    this.description,
    this.salePrice,
    this.onSalePriceStatus,
    this.onSalePrice,
    this.productReview,
    this.summerOffer,
    this.storeId,
    this.orderCount,
    this.status,
  });

  Products.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    sku = json['sku'];
    image = json['image'];
    description = json['description'];
    salePrice = json['sale_price'];
    onSalePriceStatus = json['on_sale_price_status'];
    onSalePrice = json['on_sale_price'];
    productReview = json['product_review'];
    summerOffer = json['summer_offer'];
    storeId = json['store_id'];
    orderCount = json['order_count'];
    status = json['status'];
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
  String? onSalePrice;
  String? productReview;
  String? summerOffer;
  int? storeId;
  int? orderCount;
  String? status;

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
    map['on_sale_price'] = onSalePrice;
    map['product_review'] = productReview;
    map['summer_offer'] = summerOffer;
    map['store_id'] = storeId;
    map['order_count'] = orderCount;
    map['status'] = status;
    return map;
  }
}
