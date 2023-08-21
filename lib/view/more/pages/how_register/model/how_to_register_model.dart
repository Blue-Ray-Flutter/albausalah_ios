class HowToRegisterModel {
  HowToRegisterModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.howToRegisterData,
  });

  HowToRegisterModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    howToRegisterData = json['how_to_register_data'] != null
        ? HowToRegisterData.fromJson(json['how_to_register_data'])
        : null;
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  HowToRegisterData? howToRegisterData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (howToRegisterData != null) {
      map['how_to_register_data'] = howToRegisterData!.toJson();
    }
    return map;
  }
}

class HowToRegisterData {
  HowToRegisterData({
    this.customerRegisterDescription,
    this.storeRegisterDescription,
    this.customerRegisterImage,
    this.customerRegisterVideoCover,
    this.customerRegisterVideo,
    this.storeRegisterImage,
    this.storeRegisterVideoCover,
    this.storeRegisterVideo,
  });

  HowToRegisterData.fromJson(dynamic json) {
    customerRegisterDescription = json['customer_register_description'];
    storeRegisterDescription = json['store_register_description'];
    customerRegisterImage = json['customer_register_image'];
    customerRegisterVideoCover = json['customer_register_video_cover'];
    customerRegisterVideo = json['customer_register_video'];
    storeRegisterImage = json['store_register_image'];
    storeRegisterVideoCover = json['store_register_video_cover'];
    storeRegisterVideo = json['store_register_video'];
  }
  String? customerRegisterDescription;
  String? storeRegisterDescription;
  String? customerRegisterImage;
  String? customerRegisterVideoCover;
  String? customerRegisterVideo;
  String? storeRegisterImage;
  String? storeRegisterVideoCover;
  String? storeRegisterVideo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customer_register_description'] = customerRegisterDescription;
    map['store_register_description'] = storeRegisterDescription;
    map['customer_register_image'] = customerRegisterImage;
    map['customer_register_video_cover'] = customerRegisterVideoCover;
    map['customer_register_video'] = customerRegisterVideo;
    map['store_register_image'] = storeRegisterImage;
    map['store_register_video_cover'] = storeRegisterVideoCover;
    map['store_register_video'] = storeRegisterVideo;
    return map;
  }
}
