class CartModel {
  CartModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.yourCart,
  });

  CartModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    yourCart =
        json['your_cart'] != null ? YourCart.fromJson(json['your_cart']) : null;
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  YourCart? yourCart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (yourCart != null) {
      map['your_cart'] = yourCart!.toJson();
    }
    return map;
  }
}

class CustomerCart {
  CustomerCart({
    this.id,
    this.userId,
    this.storeId,
    this.productId,
    this.sizeId,
    this.colorId,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.itemSubTotal,
    this.itemEndTotal,
    this.product,
  });

  CustomerCart.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    storeId = json['store_id'];
    productId = json['product_id'];
    sizeId = json['size_id'];
    colorId = json['color_id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    itemSubTotal = json['itemSubTotal'];
    itemEndTotal = json['itemEndTotal'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  int? id;
  int? userId;
  int? storeId;
  int? productId;
  int? sizeId;
  int? colorId;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  String? itemSubTotal;
  String? itemEndTotal;
  Product? product;

  set quantityItem(int? quantity) {
    this.quantity = quantity;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['store_id'] = storeId;
    map['product_id'] = productId;
    map['size_id'] = sizeId;
    map['color_id'] = colorId;
    map['quantity'] = quantity;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['itemSubTotal'] = itemSubTotal;
    map['itemEndTotal'] = itemEndTotal;
    if (product != null) {
      map['product'] = product!.toJson();
    }
    return map;
  }

  Map<String, dynamic> updateCart() {
    final map = <String, dynamic>{};

    map['product_id'] = productId.toString();
    map['size_id'] = sizeId;
    map['color_id'] = colorId;
    map['quantity'] = quantity;

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
    this.rememberToken,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.productPrice,
    this.name,
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
    rememberToken = json['remember_token'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productPrice = json['product_price'];
    name = json['name'];
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
  String? rememberToken;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? productPrice;
  String? name;

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
    map['remember_token'] = rememberToken;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['product_price'] = productPrice;
    map['name'] = name;
    return map;
  }
}

class YourCart {
  YourCart({
    this.customerCart,
    this.subTotal,
    this.tax,
    this.endTotal,
    this.numberOfProducts,
  });

  YourCart.fromJson(dynamic json) {
    if (json['customer_cart'] != null) {
      customerCart = [];
      json['customer_cart'].forEach((v) {
        customerCart!.add(CustomerCart.fromJson(v));
      });
    }
    subTotal = json['subTotal'];
    tax = json['tax'];
    endTotal = json['endTotal'];
    numberOfProducts = json['numberOfProducts'];
  }
  List<CustomerCart>? customerCart;
  String? subTotal;
  String? tax;
  String? endTotal;
  int? numberOfProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (customerCart != null) {
      map['customer_cart'] = customerCart!.map((v) => v.toJson()).toList();
    }
    map['subTotal'] = subTotal;
    map['tax'] = tax;
    map['endTotal'] = endTotal;
    map['numberOfProducts'] = numberOfProducts;
    return map;
  }
}
