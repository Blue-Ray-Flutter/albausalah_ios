class CartQuantity {
  CartQuantity({
    this.lang,
    this.data,
  });

  CartQuantity.fromJson(dynamic json) {
    lang = json['lang'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(CartData.fromJson(v));
      });
    }
  }
  String? lang;
  List<CartData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lang'] = lang;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CartData {
  CartData({
    this.productId,
    this.quantity,
    this.colorId,
    this.sizeId,
  });

  CartData.fromJson(dynamic json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    colorId = json['color_id'];
    sizeId = json['size_id'];
  }
  String? productId;
  int? quantity;
  int? colorId;
  int? sizeId;

  set productIdCart(String? productId) {
    this.productId = productId;
  }

  set quantityCart(int? quantity) {
    this.quantity = quantity;
  }

  set colorIdCart(int? colorId) {
    this.colorId = colorId;
  }

  set sizeIdCart(int? sizeId) {
    this.sizeId = sizeId;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['quantity'] = quantity;
    map['color_id'] = colorId;
    map['size_id'] = sizeId;
    return map;
  }
}
