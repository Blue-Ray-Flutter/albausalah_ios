class LoginSliderModel {
  LoginSliderModel({
    this.status,
    this.success,
    this.requestDate,
    this.msg,
    this.slider,
  });

  LoginSliderModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    requestDate = json['request_date'];
    msg = json['msg'];
    if (json['slider'] != null) {
      slider = [];
      json['slider'].forEach((v) {
        slider!.add(Slider.fromJson(v));
      });
    }
  }
  int? status;
  bool? success;
  String? requestDate;
  String? msg;
  List<Slider>? slider;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    map['request_date'] = requestDate;
    map['msg'] = msg;
    if (slider != null) {
      map['slider'] = slider!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Slider {
  Slider({
    this.image,
  });

  Slider.fromJson(dynamic json) {
    image = json['image'];
  }
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    return map;
  }
}
