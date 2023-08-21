class SliderModel {
  SliderModel({
    this.status,
    this.msg,
    this.slider,
    this.requestDate,
    this.success,
  });

  SliderModel.fromJson(dynamic json) {
    status = json['status'];
    requestDate = json['request_date'];
    success = json['success'];
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
    map['msg'] = msg;
    map['request_date'] = requestDate;
    map['success'] = success;
    if (slider != null) {
      map['slider'] = slider!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Slider {
  Slider({
    this.title,
    this.description,
    this.image,
    this.url,
    this.status,
  });

  Slider.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    url = json['url'];
    status = json['status'];
  }
  String? title;
  String? description;
  String? image;
  String? url;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['image'] = image;
    map['url'] = url;
    map['status'] = status;
    return map;
  }
}
